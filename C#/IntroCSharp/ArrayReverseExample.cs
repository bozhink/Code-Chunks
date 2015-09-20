class ArrayReverseExample
{
    static void Main()
    {
        int[] array = {1,2,3,4,5,6};
        int length = array.Length;
        int[] reversed = new int[length];
        
        for (int index = 0; index < length; index++)
        {
            reversed[length-index-1] = array[index];
        }
        
        for (int index = 0; index < length; index++)
        {
            System.Console.Write(reversed[index] + " ");
        }
        
        System.Console.WriteLine();
    }
}