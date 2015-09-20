using System;
using System.Threading;
using System.Globalization;

class CultureInfoExample
{
    static void Main()
    {
        DateTime d = new DateTime(2009,10,23,15,30,22);
        
        Thread.CurrentThread.CurrentCulture = CultureInfo.GetCultureInfo("en-GB");
        Console.WriteLine("{0:N}",1234.56);
        Console.WriteLine("{0:D}",d);
        
        Thread.CurrentThread.CurrentCulture = CultureInfo.GetCultureInfo("bg-BG");
        Console.WriteLine("{0:N}",1234.56);
        Console.WriteLine("{0:D}",d);
    }
}
