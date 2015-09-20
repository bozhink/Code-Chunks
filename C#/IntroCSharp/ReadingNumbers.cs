class ReadingNumbers
{
    static void Main()
    {
        System.Console.WriteLine("Enter two integers 'a' and 'b':");
        System.Console.Write("a = ");
        int a=int.Parse(System.Console.ReadLine());
        System.Console.Write("b = ");
        int b=int.Parse(System.Console.ReadLine());
        System.Console.WriteLine("{0} + {1} = {2}",a,b,a+b);
        System.Console.WriteLine("{0} * {1} = {2}",a,b,a*b);
        System.Console.WriteLine("Enter one double 'f':");
        System.Console.Write("f = ");
        double f;
        bool parseSuccess = double.TryParse(System.Console.ReadLine(),
                                            out f);
        System.Console.WriteLine(
            parseSuccess ?
            a + " * " + b + " / " + f + " = " + a*b/f
            : "Invalid number 'f'!"
        );
    }
}
