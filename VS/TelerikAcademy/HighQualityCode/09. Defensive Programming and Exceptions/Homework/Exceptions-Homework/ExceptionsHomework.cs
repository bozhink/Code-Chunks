using System;
using System.Collections.Generic;
using System.Text;

public class ExceptionsHomework
{
    public static T[] Subsequence<T>(T[] arr, int startIndex, int count)
    {
        if (0 > startIndex || startIndex + count > arr.Length)
        {
            throw new ArgumentOutOfRangeException("Invalid statIndex.");
        }

        List<T> result = new List<T>();
        for (int i = startIndex; i < startIndex + count; ++i)
        {
            result.Add(arr[i]);
        }

        return result.ToArray();
    }

    public static string ExtractEnding(string str, int count)
    {
        int length = str.Length;
        if (count > length)
        {
            throw new ArgumentException("Invalid count.");
        }

        StringBuilder result = new StringBuilder();
        for (int i = length - count; i < length; ++i)
        {
            result.Append(str[i]);
        }

        return result.ToString();
    }

    public static bool CheckPrime(int number)
    {
        bool isPrime = true;
        for (int divisor = 2; divisor <= Math.Sqrt(number); ++divisor)
        {
            if (number % divisor == 0)
            {
                isPrime = false;
                break;
            }
        }

        return isPrime;
    }

    public static void Main()
    {
        try
        {
            var substr = Subsequence("Hello!".ToCharArray(), 2, 3);
            Console.WriteLine(substr);
        }
        catch (ArgumentOutOfRangeException e)
        {
            Console.WriteLine(e.Message);
        }

        try
        {
            var subarr = Subsequence(new int[] { -1, 3, 2, 1 }, 0, 2);
            Console.WriteLine(string.Join(" ", subarr));
        }
        catch (ArgumentOutOfRangeException e)
        {
            Console.WriteLine(e.Message);
        }

        try
        {
            var allarr = Subsequence(new int[] { -1, 3, 2, 1 }, 0, 4);
            Console.WriteLine(string.Join(" ", allarr));
        }
        catch (ArgumentOutOfRangeException e)
        {
            Console.WriteLine(e.Message);
        }

        try
        {
            var emptyarr = Subsequence(new int[] { -1, 3, 2, 1 }, 0, 0);
            Console.WriteLine(string.Join(" ", emptyarr));
        }
        catch (ArgumentOutOfRangeException e)
        {
            Console.WriteLine(e.Message);
        }

        try
        {
            Console.WriteLine(ExtractEnding("I love C#", 2));
        }
        catch (ArgumentException e)
        {
            Console.WriteLine(e.Message);
        }

        try
        {
            Console.WriteLine(ExtractEnding("Nakov", 4));
        }
        catch (ArgumentException e)
        {
            Console.WriteLine(e.Message);
        }

        try
        {
            Console.WriteLine(ExtractEnding("beer", 4));
        }
        catch (ArgumentException e)
        {
            Console.WriteLine(e.Message);
        }

        try
        {
            Console.WriteLine(ExtractEnding("Hi", 100));
        }
        catch (ArgumentException e)
        {
            Console.WriteLine(e.Message);
        }

        PrintCheckPrimeResult(23);
        PrintCheckPrimeResult(33);

        try
        {
            List<Exam> peterExams = new List<Exam>()
            {
                new SimpleMathExam(2),
                new CSharpExam(55),
                new CSharpExam(100),
                new SimpleMathExam(1),
                new CSharpExam(0),
            };

            Student peter = new Student("Peter", "Petrov", peterExams);
            double peterAverageResult = peter.CalcAverageExamResultInPercents();
            Console.WriteLine("Average results = {0:p0}", peterAverageResult);
        }
        catch (ArgumentOutOfRangeException e)
        {
            Console.WriteLine(e.Message);
        }
        catch (ArgumentNullException e)
        {
            Console.WriteLine(e.Message);
        }
        catch (NullReferenceException e)
        {
            Console.WriteLine(e.Message);
        }
    }

    private static void PrintCheckPrimeResult(int number)
    {
        if (CheckPrime(number))
        {
            Console.WriteLine("{0} is prime.", number);
        }
        else
        {
            Console.WriteLine("{0} is not prime.", number);
        }
    }
}
