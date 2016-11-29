using System;
using System.Collections.Generic;

namespace ConsoleApplication
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var input = Console.ReadLine();

            Console.WriteLine(Calculate(input));
        }

        private static long Calculate(string input)
        {
            var parts = input.Split(new string[] { " " }, StringSplitOptions.RemoveEmptyEntries);
            var stack = new Stack<string>(parts);

            long result = Rec(stack);
            return result;
        }

        private static long Rec(Stack<string> stack)
        {
            if (stack.Count < 1)
            {
                return 0L;
            }

            string item = stack.Pop();

            long number;
            bool isNumber = long.TryParse(item, out number);
            if (isNumber)
            {
                return number;
            }
            else
            {
                long left, right;
                switch (item)
                {
                    case "+":
                        right = Rec(stack);
                        left = Rec(stack);
                        return left + right;

                    case "-":
                        right = Rec(stack);
                        left = Rec(stack);
                        return left - right;

                    case "*":
                        right = Rec(stack);
                        left = Rec(stack);
                        return left * right;

                    case "/":
                        right = Rec(stack);
                        left = Rec(stack);
                        return left / right;

                    case "&":
                        right = Rec(stack);
                        left = Rec(stack);
                        return left & right;

                    case "|":
                        right = Rec(stack);
                        left = Rec(stack);
                        return left | right;

                    case "^":
                        left = Rec(stack);
                        right = Rec(stack);
                        return left ^ right;

                    default:
                        throw new NotImplementedException();
                }
            }
        }
    }
}
