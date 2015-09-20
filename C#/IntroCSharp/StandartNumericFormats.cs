class StandartNumericFormats
{
    static void Main()
    {
        System.Console.WriteLine("{0:C2}",123.456);
        System.Console.WriteLine("{0:D6}",-1234);
        System.Console.WriteLine("{0:E2}",123.456);
        System.Console.WriteLine("{0:F2}",-123.456);
        System.Console.WriteLine("{0:N2}",1234567.8);
        System.Console.WriteLine("{0:P}",0.456);
        System.Console.WriteLine("{0:x}",254);
    }
}
