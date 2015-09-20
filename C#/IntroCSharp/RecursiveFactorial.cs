using System;

class RecursiveFactorial
{
    static void Main()
    {
        Console.Write("n = ");
        int n = int.Parse(Console.ReadLine());
        
        decimal factorial = Factorial(n);
        Console.WriteLine("{0}! = {1}", n, factorial);
    }
    
    static decimal Factorial(int n)
    {
        // The bootom of recursion
        if (n==0)
        {
            return 1;
        }
        // Recursive call: the method calls itself
        else
        {
            return n * Factorial(n-1);
        }
    }
}