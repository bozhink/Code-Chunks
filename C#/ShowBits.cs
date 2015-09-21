class ShowBits{
    
    int numbits;
    
    public ShowBits(int n) {
        numbits = n;
    }
    
    public void show (ulong val) {
        ulong mask = 1;
        
        mask <<= numbits-1;
        
        int spacer = 0;
        
        for (; mask!=0; mask >>=1) {
            if ( (val & mask) != 0 ) System.Console.Write("1");
            else System.Console.Write("0");
            spacer++;
            if ( (spacer%8) == 0 ) {
                System.Console.Write(" ");
                spacer = 0;
            }
        }
        System.Console.WriteLine();
    }
}

class ShowBitsDemo {
    public static void Main(string[] args)
    {
        //ShowBits b = new ShowBits(8);
        //ShowBits i = new ShowBits(32);
        //ShowBits li = new ShowBits(64);
        
        //byte B = 123;
        //uint I  = 87987;
        //ulong LI = 237658768;
        //System.Console.Write("\n" + B + " = ");
        //b.show(B);
        //System.Console.Write("\n" + I + " = ");
        //i.show(I);
        //System.Console.Write("\n" + LI + " = ");
        //li.show(LI);
        //System.Console.WriteLine();
        
        int numbits;
        ulong number;
        if (args.Length < 2) 
        {
            System.Console.WriteLine("Usage: ShowBits <lenght> <byte/uint/ulong>");
            System.Console.WriteLine("                <lenght> = 8, 32, 64");
            return;
        }
        else
        {
            if (!(int.TryParse(args[0], out numbits)))
            {
                System.Console.WriteLine("Error: Cannot read numbits");
                return;
            }
            if (!(ulong.TryParse(args[1], out number)))
            {
                System.Console.WriteLine("Error: Cannot read number");
                return;
            }
        }
        
        ShowBits sb = new ShowBits(numbits);
        sb.show(number);
    }
}