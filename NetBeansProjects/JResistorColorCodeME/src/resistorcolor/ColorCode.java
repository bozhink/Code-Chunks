package resistorcolor;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


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
    public String name;
    
    public ColorCode(String Name, int Value, String Tolerance)
    {
        name = Name;
        value = Value;
        exponent = Value;
        if (Value < 4)
            multiplier = "   ";
        else if (Value < 7)
            multiplier = " k";
        else if (Value < 10)
            multiplier = " M";
        else
            multiplier = "XXX";
        tolerance = Tolerance;
    }
    
    public static ColorCode BLACK  = new ColorCode("BLACK",0, null);
    public static ColorCode BROWN  = new ColorCode("BROWN",1," ± 1 % (F)");
    public static ColorCode RED    = new ColorCode("RED",2," ± 2 % (G)");
    public static ColorCode ORANGE = new ColorCode("ORANGE",3,null);
    public static ColorCode YELLOW = new ColorCode("YELLOW",4,null);
    public static ColorCode GREEN  = new ColorCode("GREEN",5," ± 0.5 % (D)");
    public static ColorCode BLUE   = new ColorCode("BLUE",6," ± 0.25 % (C)");
    public static ColorCode VIOLET = new ColorCode("VIOLET",7," ± 0.10 % (B)");
    public static ColorCode GREY   = new ColorCode("GREY",8," ± 0.05 %");
    public static ColorCode WHITE  = new ColorCode("WHITE",9,null);
    public static ColorCode GOLD   = new ColorCode("GOLD",-1," ± 5 % (J)");
    public static ColorCode SILVER = new ColorCode("SILVER",-2," ± 10 % (K)");
    public static ColorCode NONE   = new ColorCode("",-3," ± 20 %");
}
