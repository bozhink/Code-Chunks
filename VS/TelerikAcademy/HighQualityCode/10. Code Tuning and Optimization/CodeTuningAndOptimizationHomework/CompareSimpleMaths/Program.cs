using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CompareSimpleMaths
{
    /// <summary>
    /// Task 2. Compare simple Maths
    /// Write a program to `compare the performance` of:
    ///     **add**, **subtract**, **increment**, **multiply**, **divide**
    /// for the values:
    ///     `int`, `long`, `float`, `double` and `decimal`
    /// </summary>
    public class CompareSimpleMaths
    {
        private const int NumberOfSamples = 10000000;
        
        public static void Main(string[] args)
        {
            Random random = new Random();

            Console.Write("Control test: random generator timing: ");
            DisplayExecutionTime(() =>
            {
                for (int i = 0; i < NumberOfSamples; ++i)
                {
                    int a = random.Next(0, 100);
                }
            });

            Add(random);
            Substract(random);
            Increment(random);
            Multiply(random);
            Divide(random);

            Console.WriteLine("===============================================");

            Console.WriteLine("Dynamic int");
            ExecuteSimpleMathsTests(random.Next(1, 100), random.Next(1, 100));

            Console.WriteLine("Dynamic long"); 
            ExecuteSimpleMathsTests(random.Next(1, 100) * 1L, random.Next(1, 100) * 1L);

            Console.WriteLine("Dynamic float");
            ExecuteSimpleMathsTests(random.Next(1, 100) * 1.0f, random.Next(1, 100) * 1.0f);

            Console.WriteLine("Dynamic double");
            ExecuteSimpleMathsTests(random.Next(1, 100) * 1.0, random.Next(1, 100) * 1.0);

            Console.WriteLine("Dynamic decimal");
            ExecuteSimpleMathsTests(random.Next(1, 100) * 1.0m, random.Next(1, 100) * 1.0m);
        }

        private static void Add(Random random)
        {
            Console.Write("int + : ");
            DisplayExecutionTime(() =>
            {
                int a = random.Next(0, 100);
                int b = random.Next(0, 100);
                int c;
                for (int i = 0; i < NumberOfSamples; ++i)
                {
                    c = a + b;
                }
            });

            Console.Write("long + : ");
            DisplayExecutionTime(() =>
            {
                long a = (long)random.Next(0, 100);
                long b = (long)random.Next(0, 100);
                long c;
                for (int i = 0; i < NumberOfSamples; ++i)
                {
                    c = a + b;
                }
            });

            Console.Write("float + : ");
            DisplayExecutionTime(() =>
            {
                float a = (float)random.Next(0, 100);
                float b = (float)random.Next(0, 100);
                float c;
                for (int i = 0; i < NumberOfSamples; ++i)
                {
                    c = a + b;
                }
            });

            Console.Write("double + : ");
            DisplayExecutionTime(() =>
            {
                double a = (double)random.Next(0, 100);
                double b = (double)random.Next(0, 100);
                double c;
                for (int i = 0; i < NumberOfSamples; ++i)
                {
                    c = a + b;
                }
            });

            Console.Write("decimal + : ");
            DisplayExecutionTime(() =>
            {
                decimal a = (decimal)random.Next(0, 100);
                decimal b = (decimal)random.Next(0, 100);
                decimal c;
                for (int i = 0; i < NumberOfSamples; ++i)
                {
                    c = a + b;
                }
            });
        }

        private static void Substract(Random random)
        {
            Console.Write("int - : ");
            DisplayExecutionTime(() =>
            {
                int a = random.Next(0, 100);
                int b = random.Next(0, 100);
                int c;
                for (int i = 0; i < NumberOfSamples; ++i)
                {
                    c = a - b;
                }
            });

            Console.Write("long - : ");
            DisplayExecutionTime(() =>
            {
                long a = (long)random.Next(0, 100);
                long b = (long)random.Next(0, 100);
                long c;
                for (int i = 0; i < NumberOfSamples; ++i)
                {
                    c = a - b;
                }
            });

            Console.Write("float - : ");
            DisplayExecutionTime(() =>
            {
                float a = (float)random.Next(0, 100);
                float b = (float)random.Next(0, 100);
                float c;
                for (int i = 0; i < NumberOfSamples; ++i)
                {
                    c = a - b;
                }
            });

            Console.Write("double - : ");
            DisplayExecutionTime(() =>
            {
                double a = (double)random.Next(0, 100);
                double b = (double)random.Next(0, 100);
                double c;
                for (int i = 0; i < NumberOfSamples; ++i)
                {
                    c = a - b;
                }
            });

            Console.Write("decimal - : ");
            DisplayExecutionTime(() =>
            {
                decimal a = (decimal)random.Next(0, 100);
                decimal b = (decimal)random.Next(0, 100);
                decimal c;
                for (int i = 0; i < NumberOfSamples; ++i)
                {
                    c = a - b;
                }
            });
        }

        private static void Increment(Random random)
        {
            Console.Write("int ++ : ");
            DisplayExecutionTime(() =>
            {
                int a = random.Next(0, 100);
                for (int i = 0; i < NumberOfSamples; ++i)
                {
                    a++;
                }
            });

            Console.Write("long ++ : ");
            DisplayExecutionTime(() =>
            {
                long a = (long)random.Next(0, 100);
                for (int i = 0; i < NumberOfSamples; ++i)
                {
                    a++;
                }
            });

            Console.Write("float ++ : ");
            DisplayExecutionTime(() =>
            {
                float a = (float)random.Next(0, 100);
                for (int i = 0; i < NumberOfSamples; ++i)
                {
                    a += 1.0f;
                }
            });

            Console.Write("double ++ : ");
            DisplayExecutionTime(() =>
            {
                double a = (double)random.Next(0, 100);
                for (int i = 0; i < NumberOfSamples; ++i)
                {
                    a += 1.0;
                }
            });

            Console.Write("decimal ++ : ");
            DisplayExecutionTime(() =>
            {
                decimal a = (decimal)random.Next(0, 100);
                for (int i = 0; i < NumberOfSamples; ++i)
                {
                    a += 1.0m;
                }
            });
        }

        private static void Multiply(Random random)
        {
            Console.Write("int * : ");
            DisplayExecutionTime(() =>
            {
                int a = random.Next(0, 100);
                int b = random.Next(0, 100);
                int c;
                for (int i = 0; i < NumberOfSamples; ++i)
                {
                    c = a * b;
                }
            });

            Console.Write("long * : ");
            DisplayExecutionTime(() =>
            {
                long a = (long)random.Next(0, 100);
                long b = (long)random.Next(0, 100);
                long c;
                for (int i = 0; i < NumberOfSamples; ++i)
                {
                    c = a * b;
                }
            });

            Console.Write("float * : ");
            DisplayExecutionTime(() =>
            {
                float a = (float)random.Next(0, 100);
                float b = (float)random.Next(0, 100);
                float c;
                for (int i = 0; i < NumberOfSamples; ++i)
                {
                    c = a * b;
                }
            });

            Console.Write("double * : ");
            DisplayExecutionTime(() =>
            {
                double a = (double)random.Next(0, 100);
                double b = (double)random.Next(0, 100);
                double c;
                for (int i = 0; i < NumberOfSamples; ++i)
                {
                    c = a * b;
                }
            });

            Console.Write("decimal * : ");
            DisplayExecutionTime(() =>
            {
                decimal a = (decimal)random.Next(0, 100);
                decimal b = (decimal)random.Next(0, 100);
                decimal c;
                for (int i = 0; i < NumberOfSamples; ++i)
                {
                    c = a * b;
                }
            });
        }

        private static void Divide(Random random)
        {
            Console.Write("int / : ");
            DisplayExecutionTime(() =>
            {
                int a = random.Next(1, 100);
                int b = random.Next(1, 100);
                int c;
                for (int i = 0; i < NumberOfSamples; ++i)
                {
                    c = a / b;
                }
            });

            Console.Write("long / : ");
            DisplayExecutionTime(() =>
            {
                long a = (long)random.Next(1, 100);
                long b = (long)random.Next(1, 100);
                long c;
                for (int i = 0; i < NumberOfSamples; ++i)
                {
                    c = a / b;
                }
            });

            Console.Write("float / : ");
            DisplayExecutionTime(() =>
            {
                float a = (float)random.Next(1, 100);
                float b = (float)random.Next(1, 100);
                float c;
                for (int i = 0; i < NumberOfSamples; ++i)
                {
                    c = a / b;
                }
            });

            Console.Write("double / : ");
            DisplayExecutionTime(() =>
            {
                double a = (double)random.Next(1, 100);
                double b = (double)random.Next(1, 100);
                double c;
                for (int i = 0; i < NumberOfSamples; ++i)
                {
                    c = a / b;
                }
            });

            Console.Write("decimal / : ");
            DisplayExecutionTime(() =>
            {
                decimal a = (decimal)random.Next(1, 100);
                decimal b = (decimal)random.Next(1, 100);
                decimal c;
                for (int i = 0; i < NumberOfSamples; ++i)
                {
                    c = a / b;
                }
            });
        }

        private static void ExecuteSimpleMathsTests(dynamic a, dynamic b)
		{

			Console.Write("+ : ");
			DisplayExecutionTime(() =>
			{
				for (int i = 0; i < NumberOfSamples; ++i)
				{
                    var c = a + b;
				}
			});

			Console.Write("- : ");
			DisplayExecutionTime(() =>
			{
                for (int i = 0; i < NumberOfSamples; ++i)
				{
                    var c = a - b;
				}
			});

			Console.Write("++ : ");
			DisplayExecutionTime(() =>
			{
                for (int i = 0; i < NumberOfSamples; ++i)
				{
					a++;
				}
			});

			Console.Write("* : ");
			DisplayExecutionTime(() =>
			{
                for (int i = 0; i < NumberOfSamples; ++i)
				{
					var c = a * b;
				}
			});

			Console.Write("/ : ");
            DisplayExecutionTime(() =>
            {
                for (int i = 0; i < NumberOfSamples; ++i)
                {
                    var c = a / b;
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
