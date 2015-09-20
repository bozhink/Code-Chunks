class Sum3Int
{
    static void Main()
    {
        System.Console.WriteLine("This Program calculates the sum of 3 integers");
        System.Console.WriteLine("\nEnter the three integers to sum up:");
        int[] a = new int[3];
        int sum=0;
        for (int i=0; i<3; i++)
        {
            a[i] = int.Parse(System.Console.ReadLine());
            sum += a[i];
        }
        System.Console.WriteLine("sum = {0}", sum);
    }
}