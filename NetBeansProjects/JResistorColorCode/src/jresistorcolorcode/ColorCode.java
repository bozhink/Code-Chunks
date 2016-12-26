/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package jresistorcolorcode;

/**
 *
 * @author Bozhin A. Karaivanov
 */
public class ColorCode 
{
    public int value;
    public int exponent;
    public String multiplier;
    public String tolerance;
    
    ColorCode(int Value, String Tolerance)
    {
        value = Value;
        exponent = Value;
        if (Value < 4)
            multiplier = "   ";
        else if (Value < 7)
            multiplier = " kΩ";
        else if (Value < 10)
            multiplier = " MΩ";
        else
            multiplier = "XXX";
        tolerance = Tolerance;
    }
    
    static ColorCode BLACK  = new ColorCode(0, null);
    static ColorCode BROWN  = new ColorCode(1," ± 1 % (F)");
    static ColorCode RED    = new ColorCode(2," ± 2 % (G)");
    static ColorCode ORANGE = new ColorCode(3,null);
    static ColorCode YELLOW = new ColorCode(4,null);
    static ColorCode GREEN  = new ColorCode(5," ± 0.5 % (D)");
    static ColorCode BLUE   = new ColorCode(6," ± 0.25 % (C)");
    static ColorCode VIOLET = new ColorCode(7," ± 0.10 % (B)");
    static ColorCode GREY   = new ColorCode(8," ± 0.05 %");
    static ColorCode WHITE  = new ColorCode(9,null);
    static ColorCode GOLD   = new ColorCode(-1," ± 5 % (J)");
    static ColorCode SILVER = new ColorCode(-2," ± 10 % (K)");
    static ColorCode NONE   = new ColorCode(-3," ± 20 %");
}
