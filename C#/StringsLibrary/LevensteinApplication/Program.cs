using Levensteint;

namespace LevensteinApplication
{
    using System;

    public class Program
    {
        public static void Main(string[] args)
        {
            // Expected: 1 5 3
            Console.WriteLine(LevenshteinDistance.Compute("aunt", "ant"));
            Console.WriteLine(LevenshteinDistance.Compute("Sam", "Samantha"));
            Console.WriteLine(LevenshteinDistance.Compute("flomax", "volmax"));
        }
    }
}


