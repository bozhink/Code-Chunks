using System;

class Mod5
{
    static void Main()
    {
        Console.WriteLine("This program counts the number of integes divisible to 5 "+
                          "between two other integer a nad b");
        bool parsedA = false;
        bool parsedB = false;
        int a=0, b=0;
        
        while (!parsedA)
        {
            Console.Write("Enter integer a = ");
            parsedA = int.TryParse(Console.ReadLine(), out a);
            Console.WriteLine(parsedA ? "a = "+a : "Invalid integer! Try again.");
        }
        
        while (!parsedB)
        {
            Console.Write("Enter integer b = ");
            parsedB = int.TryParse(Console.ReadLine(), out b);
            Console.WriteLine(parsedB ? "b = "+b : "Invalid integer! Try again.");
        }
        
        int count = 0;
        int i;
        
        for (i=a; i<=b; i++)
        {
            if ((i%5)==0) count++;
        }
        
        Console.WriteLine("Number of integers divisible to 5 between {0} and {1} is {2}",
                            a,b,count);
    }
}