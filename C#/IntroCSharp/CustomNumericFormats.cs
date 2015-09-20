class CustomNumericFormats
{
    static void Main()
    {
        System.Console.WriteLine("{0:00.00}",1.2);
        System.Console.WriteLine("{0:##.#####}",0.234);
        System.Console.WriteLine("{0:#####}",12345.67);
        System.Console.WriteLine("{0:(0#) ### ## ##}", 29342525);
        System.Console.WriteLine("{0:%##}",0.234);
    }
}
