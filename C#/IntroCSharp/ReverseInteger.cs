using System;

class ReverseInteger
{
    static int Reverse(int n)
    {
        int sign = n<0 ? -1 : 1;
        int N = sign*n;
        string sold = N.ToString();
        string snew="";
        for (int i=0; i<sold.Length; i++)
        {
            snew += sold[sold.Length - 1 - i];
        }
        return sign*int.Parse(snew);
    }
    
    static void Main(string[] args)
    {
        if (args.Length < 1)
        {
            Console.WriteLine("Usage: LastDigit <number>");
            return;
        }
        int n;
        if (!(int.TryParse(args[0], out n)))
        {
            Console.WriteLine("Error: invalid integer: {0}", args[0]);
            return;
        }
        Console.WriteLine(Reverse(n));
    }
}
