using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CompareAdvancedMaths
{
    /// <summary>
    /// Task 3. Compare advanced Maths
    /// Write a program to `compare the performance` of:
    /// 	**square root**, **natural logarithm**, **sinus**
    /// for the values:
    ///     `float`, `double` and `decimal`
    /// </summary>
    public class CompareAdvancedMaths
    {
        private const int NumberOfSamples = 10000000;

        public static void Main(string[] args)
        {
            Random random = new Random();
            SquareRoot(random);
            Log(random);
            Sin(random);

            Console.WriteLine("Dynamic float");
            ExecuteAdvancedMathsTests((float)random.NextDouble());

            Console.WriteLine("Dynamic double");
            ExecuteAdvancedMathsTests(random.NextDouble());

            Console.WriteLine("Dynamic decimal");
            ExecuteAdvancedMathsTests((decimal)random.NextDouble());
        }

        private static void SquareRoot(Random random)
        {
            Console.Write("float squre root : ");
            DisplayExecutionTime(() =>
            {
                float a = (float)random.NextDouble();
                float b;
                for (int i = 0; i < NumberOfSamples; ++i)
                {
                    b = (float)Math.Sqrt((double)a);
                }
            });

            Console.Write("double squre root : ");
            DisplayExecutionTime(() =>
            {
                double a = random.NextDouble();
                double b;
                for (int i = 0; i < NumberOfSamples; ++i)
                {
                    b = Math.Sqrt(a);
                }
            });

            Console.Write("decimal squre root : ");
            DisplayExecutionTime(() =>
            {
                decimal a = (decimal)random.NextDouble();
                decimal b;
                for (int i = 0; i < NumberOfSamples; ++i)
                {
                    b = (decimal)Math.Sqrt((double)a);
                }
            });
        }

        private static void Log(Random random)
        {
            Console.Write("float log : ");
            DisplayExecutionTime(() =>
            {
                float a = (float)random.NextDouble();
                float b;
                for (int i = 0; i < NumberOfSamples; ++i)
                {
                    b = (float)Math.Log((double)a);
                }
            });

            Console.Write("double log : ");
            DisplayExecutionTime(() =>
            {
                double a = random.NextDouble();
                double b;
                for (int i = 0; i < NumberOfSamples; ++i)
                {
                    b = Math.Log(a);
                }
            });

            Console.Write("decimal log : ");
            DisplayExecutionTime(() =>
            {
                decimal a = (decimal)random.NextDouble();
                decimal b;
                for (int i = 0; i < NumberOfSamples; ++i)
                {
                    b = (decimal)Math.Log((double)a);
                }
            });
        }

        private static void Sin(Random random)
        {
            Console.Write("float sin : ");
            DisplayExecutionTime(() =>
            {
                float a = (float)random.NextDouble();
                float b;
                for (int i = 0; i < NumberOfSamples; ++i)
                {
                    b = (float)Math.Sin((double)a);
                }
            });

            Console.Write("double sin : ");
            DisplayExecutionTime(() =>
            {
                double a = random.NextDouble();
                double b;
                for (int i = 0; i < NumberOfSamples; ++i)
                {
                    b = Math.Sin(a);
                }
            });

            Console.Write("decimal sin : ");
            DisplayExecutionTime(() =>
            {
                decimal a = (decimal)random.NextDouble();
                decimal b;
                for (int i = 0; i < NumberOfSamples; ++i)
                {
                    b = (decimal)Math.Sin((double)a);
                }
            });
        }

        private static void ExecuteAdvancedMathsTests(dynamic a)
        {

            Console.Write("square root : ");
            DisplayExecutionTime(() =>
            {
                for (int i = 0; i < NumberOfSamples; ++i)
                {
                    var b = (dynamic)Math.Sqrt((double)a);
                }
            });

            Console.Write("natural logarithm : ");
            DisplayExecutionTime(() =>
            {
                for (int i = 0; i < NumberOfSamples; ++i)
                {
                    var b = (dynamic)Math.Log((double)a);
                }
            });

            Console.Write("sinus : ");
            DisplayExecutionTime(() =>
            {
                for (int i = 0; i < NumberOfSamples; ++i)
                {
                    var b = (dynamic)Math.Sin((double)a);
                }
            });
        }

        private static void DisplayExecutionTime(Action action)
        {
            Stopwatch stopwatch = new Stopwatch();
            stopwatch.Start();
            action();
            stopwatch.Stop();
            Console.WriteLine(stopwatch.Elapsed);
            Console.WriteLine("Time [in ns] per operation: {0}\n", stopwatch.ElapsedMilliseconds * 1.0e6 / NumberOfSamples);
        }
    }
}
