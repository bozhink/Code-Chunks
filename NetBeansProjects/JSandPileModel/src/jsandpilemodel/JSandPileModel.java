/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package jsandpilemodel;

/**
 *
 * @author bozhin
 */
public class JSandPileModel
{
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) 
    {
        SandPile sp = new SandPile();
        for (int i = 0; i<500; i++)
        {
            sp.Step();
        }
        
        for (int i=0; i<10; i++)
        {
            for (int j=0; j<10; j++)
            {
                System.err.print(sp.GetElement(i, j) + "\t");
            }
            System.err.print("\n");
        }
        
    }
}
