/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package jresistorcolorcode;

/**
 *
 * @author Owner
 */
public class JResistorColorCode {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) 
    {
        ColorCode x1 = ColorCode.BLUE;
        System.out.println(x1.value + x1.multiplier + x1.tolerance);
        
        ResistorColorCode x2 = new
                ResistorColorCode(
                ColorCode.RED,
                ColorCode.BLACK,
                ColorCode.VIOLET,
                ColorCode.BLUE,
                ColorCode.BLACK
                );
        System.out.println(x2.GetColorCode());
    }
}
