using System;

class Fibonacci
{
    static void Main(string[] argv)
    {
        int n = 100;
        if (argv.Length >= 1)
        {
            bool parsed = int.TryParse(argv[0],out n);
            if (!parsed) n=100;
        }
        
        ulong a = 0;
        ulong b = 1;
        ulong c;
        
        Console.WriteLine("{0,30:N}",a);
        Console.WriteLine("{0,30:N}",b);
        
        for (int i = 2; i < n; i++)
        {
            c = b + a;
            a = b;
            b = c;
            Console.WriteLine("{0,30:N}",b);
        }
    }
}