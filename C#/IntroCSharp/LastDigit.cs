using System;

class LastDigit
{
    static string SayLastDigit(int n)
    {
        string s = n.ToString();
        char c = s[s.Length-1];
        string name="";
        switch (c)
        {
            case '0': name = "zero"; break;
            case '1': name = "one"; break;
            case '2': name = "two"; break;
            case '3': name = "three"; break;
            case '4': name = "four"; break;
            case '5': name = "five"; break;
            case '6': name = "six"; break;
            case '7': name = "seven"; break;
            case '8': name = "eight"; break;
            case '9': name = "nine"; break;
        }
        return name;
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
        Console.WriteLine(SayLastDigit(n));
    }
}
