using System;

class MinMax
{
    static void Main(string[] argv)
    {
        if (argv.Length < 2) 
        {
            Console.WriteLine("Usage: MinMax <int a> <int b>");
            return;
        }
        
        int a,b;
        bool parsedA = int.TryParse(argv[0],out a);
        bool parsedB = int.TryParse(argv[1],out b);
        
        if (! (parsedA && parsedB) )
        {
            Console.WriteLine("Error in input parameters");
            return;
        }
        
        Console.WriteLine("Greater: {0}", (a+b+Math.Abs(a-b))/2.0);
        Console.WriteLine("Smaller: {0}", (a+b-Math.Abs(a-b))/2.0);
        
        int max = a - ( (a-b) & ( (a-b)>>31 ) );
        Console.WriteLine(max);
    }
}