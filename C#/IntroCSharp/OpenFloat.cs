using System;

namespace OFloat
{
    public class OpenFloat
    {
        public static void Main(string[] args)
        {
            float f, F;
            f = F = 3.141592f;
            if (args.Length > 0)
            {
                if ( !( float.TryParse(args[0],out f) ) )
                {
                    f  = F;
                }
            }   
        
            long n = System.BitConverter.DoubleToInt64Bits(f);
        
            System.Console.WriteLine("{0} {1}", f,n);
        
            int bitsNumber = 64;
            
            ShowBits sb = new ShowBits(bitsNumber);
            
            sb.show((ulong)n);
        }
    }
    
    public class ShowBits
    {
        int numbits;
        
        public ShowBits(int n) {
            numbits = n;
        }
    
        public void show (ulong val) {
            ulong mask = 1;
        
            mask <<= numbits-1;
        
            uint spacer = 0;
        
            for (; mask!=0; mask >>=1)
            {
                if ( (val & mask) != 0 ) Console.Write("1");
                else Console.Write("0");
                spacer++;
                if ( (spacer%8) == 0 ) 
                {
                    Console.Write(" ");
                    spacer = 0;
                }
            }
            Console.WriteLine();
        }
    }

}