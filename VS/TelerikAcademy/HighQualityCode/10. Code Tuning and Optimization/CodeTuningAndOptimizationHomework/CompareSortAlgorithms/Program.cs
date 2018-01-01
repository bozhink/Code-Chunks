using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CompareSortAlgorithms
{
    /// <summary>
    /// Write a program to `compare the performance` of:
    /// **insertion sort**, **selection sort**, **quicksort**
    /// for the values:
    /// `int`, `double` and `string`
    /// Check also the following cases:
    /// **random values**, **sorted values**, **values sorted** in **reversed order**.
    /// </summary>
    public class CompareSortAlgorithms
    {
        private const int NumberOfSamples = 100000;
        ////private const int NumberOfSamples = 1;

        public static void Main(string[] args)
        {
            Random random = new Random();
            int[] arr = new int[] {
                random.Next(0,100),
                random.Next(0,100),
                random.Next(0,100),
                random.Next(0,100),
                random.Next(0,100),
                random.Next(0,100),
                random.Next(0,100)
            };
            int[] arrSort = (int[])arr.Clone();
            int[] arrReversed = (int[])arr.Clone();
            GetThreeArrays<int>(ref arr, ref arrSort, ref arrReversed);

            CompareSortingAlgorithms("int", (int[])arr.Clone());
            CompareSortingAlgorithms("int", (int[])arrSort.Clone());
            CompareSortingAlgorithms("int", (int[])arrReversed.Clone());

            CompareSortingAlgorithms("double", arr.Select(c => (double)c).ToArray());
            CompareSortingAlgorithms("double", arrSort.Select(c => (double)c).ToArray());
            CompareSortingAlgorithms("double", arrReversed.Select(c => (double)c).ToArray());

            CompareSortingAlgorithms("string", arr.Select(c => (char)c).ToArray());
            CompareSortingAlgorithms("string", arrSort.Select(c => (char)c).ToArray());
            CompareSortingAlgorithms("string", arrReversed.Select(c => (char)c).ToArray());
        }

        private static void GetThreeArrays<T>(ref T[] arr, ref T[] arrSorted, ref T[] arrReversed)
            where T : IComparable
        {
            List<T> arrToTList = arr.ToList<T>();
            arrToTList.Sort();
            arrSorted = arrToTList.ToArray();
            arrReversed = arrSorted.Reverse<T>().ToArray<T>();
        }

        private static void CompareSortingAlgorithms<T>(string type, T[] arr)
            where T : IComparable
        {
            Console.Write("\n\nInput array:");
            for (int i = 0, length = arr.Length; i < length; ++i)
            {
                Console.Write(" {0}", arr[i]);
            }

            Console.WriteLine();

            Console.Write("{0} insertion sort:", type);
            DisplayExecutionTime(() =>
            {
                for (int i = 0; i < NumberOfSamples; ++i)
                {
                    InsertionSort((T[])arr.Clone());
                }
            });

            Console.Write("{0} selection sort:", type);
            DisplayExecutionTime(() =>
            {
                for (int i = 0; i < NumberOfSamples; ++i)
                {
                    SelectionSort((T[])arr.Clone());
                }
            });

            Console.Write("{0} quicksort:", type);
            DisplayExecutionTime(() =>
            {
                for (int i = 0; i < NumberOfSamples; ++i)
                {
                    QuickSort((T[])arr.Clone(), 0, arr.Length - 1);
                }
            });
        }

        private static void InsertionSort<T>(T[] arr)
            where T : IComparable
        {
            for (int i = 0, length = arr.Length; i < length - 1; ++i)
            {
                for (int j = i + 1; j > 0; --j)
                {
                    if (arr[j - 1].CompareTo(arr[j]) > 0)
                    {
                        SwapTwoItemsInArray(arr, j, j - 1);
                    }
                }
            }

            ////for (int i = 0, length = arr.Length; i < length; ++i)
            ////{
            ////    Console.Write(" {0}", arr[i]);
            ////}
        }

        private static void SelectionSort<T>(T[] arr)
            where T : IComparable
        {
            for (int i = 0, length = arr.Length; i < length; ++i)
            {
                int indexOfMinimalElement = i;
                for (int j = i + 1; j < length; ++j)
                {
                    if (arr[j].CompareTo(arr[indexOfMinimalElement]) < 0)
                    {
                        indexOfMinimalElement = j;
                    }
                }

                SwapTwoItemsInArray(arr, i, indexOfMinimalElement);
            }

            ////for (int i = 0, length = arr.Length; i < length; ++i)
            ////{
            ////    Console.Write(" {0}", arr[i]);
            ////}
        }

        private static void QuickSort<T>(T[] arr, int left, int right)
            where T : IComparable
        {
            int i = left, j = right;
            T pivot = arr[(left + right) / 2];

            while (i <= j)
            {
                while (arr[i].CompareTo(pivot) < 0)
                {
                    ++i;
                }

                while (arr[j].CompareTo(pivot) > 0)
                {
                    --j;
                }

                if (i <= j)
                {
                    SwapTwoItemsInArray<T>(arr, i++, j--);
                }
            }

            if (left < j)
            {
                QuickSort(arr, left, j);
            }

            if (i < right)
            {
                QuickSort(arr, i, right);
            }

            ////for (int k = 0, length = arr.Length; k < length; ++k)
            ////{
            ////    Console.Write(" {0}", arr[k]);
            ////}
        }

        private static void SwapTwoItemsInArray<T>(T[] arr, int indexOfFirstItem, int indexOfSecondItem)
        {
            T swapValue = arr[indexOfFirstItem];
            arr[indexOfFirstItem] = arr[indexOfSecondItem];
            arr[indexOfSecondItem] = swapValue;
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
