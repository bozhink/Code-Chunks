using System;

class ThreeColumns
{
    static void Main()
    {
        uint n = 12;
        double a = 3.234203421;
        double b = -23.23442;
        
        Console.WriteLine("{0,-10:x}{1,-10:f2}{2,-10:f2}",n,a,b);
    }
}