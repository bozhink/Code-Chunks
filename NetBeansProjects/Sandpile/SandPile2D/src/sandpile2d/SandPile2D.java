package sandpile2d;

import java.io.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author bozhin
 */
public class SandPile2D
{
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args)
    {
        int nx = 50, ny = 50;
        int hx = 10, hy = 10;
        
        int maxIterations = 5000;
        SandPile sandPile = new SandPile(nx, ny);
        
        String line=null;
        String fname=null;
        
        for (int i=0; i<maxIterations; i++)
        {
            FileOutputStream fout=null;
            try
            {
                
                if (i<10)
                {
                    fname = "btw-000"+i+".txt";
                }
                else if (i<100)
                {
                    fname = "btw-00"+i+".txt";
                }
                else if (i<1000)
                {
                    fname = "btw-0"+i+".txt";
                    
                }
                else
                {
                    fname = "btw-"+i+".txt";
                }
                fout = new FileOutputStream(fname);
            }
            catch (FileNotFoundException e)
            {
                System.err.println("Error opening fil #"+i);
            }
            
            System.err.println(fname);
            
            sandPile.Step();
            try
            {
//                for (int x=0; x<nx; x++ )
//                {
//                    line = "";
//                    for(int y=0; y<ny; y++)
//                    {
//                        line += Integer.toString(sandPile.GetElement(x, y)) + " ";
//                    }
//                    line += "\n";
//                    fout.write(line.getBytes());
//               }
                for (int x=0; x<nx; x++)
                {
                    for (int y=0; y<ny; y++)
                    {
                        line = Integer.toString(x*hx) + "\t" +
                                Integer.toString(y*hy) + "\t" +
                                Integer.toString(hx) + "\t" +
                                Integer.toString(hy) + "\t" +
                                Integer.toString(sandPile.GetElement(x, y)) +"\n";
                        fout.write(line.getBytes());
                    }
                }
            }
            catch (IOException e)
            {
                System.err.println("Error writing to file #"+i);
            }
            try 
            {
                fout.close();
            } 
            catch (IOException ex) 
            {
                Logger.getLogger(SandPile2D.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
