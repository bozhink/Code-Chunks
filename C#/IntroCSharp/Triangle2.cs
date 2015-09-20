using System;

class Triangle1
{
    static void Main()
    {
        int n = int.Parse(Console.ReadLine());
        string format;
        string srow="";
        
        for (int row = 1; row <= n; row++)
        {
            format = "{0," + (2*n - row+1) + "}";
            srow="";
            for (int col = row; col <= n; col++)
            {
                srow+="*";
            }
            Console.Write(format,srow);
            Console.WriteLine();
        }
    }
}