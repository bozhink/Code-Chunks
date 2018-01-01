using System;
using System.Diagnostics;
using System.Linq;

public class AssertionsHomework
{
    public static void Main()
    {
        int[] arr = new int[] { 3, -1, 15, 4, 17, 2, 33, 0 };
        Console.WriteLine("arr = [{0}]", string.Join(", ", arr));
        SelectionSort(arr);
        Console.WriteLine("sorted = [{0}]", string.Join(", ", arr));

        SelectionSort(new int[0]); // Test sorting empty array
        SelectionSort(new int[1]); // Test sorting single element array

        Console.WriteLine(BinarySearch(arr, -1000));
        Console.WriteLine(BinarySearch(arr, 0));
        Console.WriteLine(BinarySearch(arr, 17));
        Console.WriteLine(BinarySearch(arr, 10));
        Console.WriteLine(BinarySearch(arr, 1000));
    }

    public static void SelectionSort<T>(T[] arr) where T : IComparable<T>
    {
        int length = arr.Length;
        Debug.Assert(length > 0, "Array is empty.");
        Debug.Assert(length > 1, "Cannot sort one element.");
        for (int index = 0; index < length - 1; ++index)
        {
            int minElementIndex = FindMinElementIndex(arr, index, length - 1);
            Debug.Assert(0 <= minElementIndex && minElementIndex < length, "minElementIndex is out of range.");
            Swap(ref arr[index], ref arr[minElementIndex]);
        }
    }

    public static int BinarySearch<T>(T[] arr, T value) where T : IComparable<T>
    {
        Debug.Assert(arr.Length > 0, "Array is empty.");
        return BinarySearch(arr, value, 0, arr.Length - 1);
    }

    private static int BinarySearch<T>(T[] arr, T value, int startIndex, int endIndex) 
        where T : IComparable<T>
    {
        Debug.Assert(arr.Length > 0, "Array is empty.");
        Debug.Assert(0 <= startIndex && startIndex < arr.Length, "startIndex is out of range.");
        Debug.Assert(0 <= endIndex && endIndex < arr.Length, "endIndex is out of range.");
        while (startIndex <= endIndex)
        {
            int midIndex = (startIndex + endIndex) / 2;
            Debug.Assert(0 <= midIndex && midIndex < arr.Length, "midIndex is out of range.");
            if (arr[midIndex].Equals(value))
            {
                return midIndex;
            }
            
            if (arr[midIndex].CompareTo(value) < 0)
            {
                Debug.Assert((0 <= (midIndex + 1)) && ((midIndex + 1) < arr.Length), "midIndex + 1 is out of range.");
                
                // Search on the right half
                startIndex = midIndex + 1;
            }
            else 
            {
                Debug.Assert((0 <= (midIndex - 1)) && ((midIndex - 1) < arr.Length), "midIndex - 1 is out of range.");
                
                // Search on the right half
                endIndex = midIndex - 1;
            }
        }

        // Searched value not found
        return -1;
    }

    private static int FindMinElementIndex<T>(T[] arr, int startIndex, int endIndex)
    where T : IComparable<T>
    {
        Debug.Assert(arr.Length > 0, "Array is empty.");
        Debug.Assert(0 <= startIndex && startIndex < arr.Length, "startIndex is out of range.");
        Debug.Assert(0 <= endIndex && endIndex < arr.Length, "endIndex is out of range.");
        int minElementIndex = startIndex;
        Debug.Assert(startIndex < endIndex, "endIndex must be greater than startIndex.");
        for (int i = startIndex + 1; i <= endIndex; i++)
        {
            if (arr[i].CompareTo(arr[minElementIndex]) < 0)
            {
                minElementIndex = i;
            }
        }

        return minElementIndex;
    }

    private static void Swap<T>(ref T x, ref T y)
    {
        T oldX = x;
        x = y;
        y = oldX;
    }
}
