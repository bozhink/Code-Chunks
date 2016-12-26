/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package jresistorcolorcode;

/**
 *
 * @author Bozhin A. Karaivanov
 */
public class ResistorColorCode 
{
    /*
     * COLOR    1st BAND   2nd BAND   3rd BAND   MULTIPLIER    TOLERANCE
     * BLACK    0          0          0          1
     * BROWN    1          1          1          10            1 % (F)
     * RED      2          2          2          100           2 % (G)
     * ORANGE   3          3          3          1000
     * YELLOW   4          4          4          10000
     * GREEN    5          5          5          100000        0.5 % (D)
     * BLUE     6          6          6          1000000       0.25 % (C)
     * VIOLET   7          7          7          10000000      0.10 % (B)
     * GREY     8          8          8          100000000     0.05 %
     * WHITE    9          9          9          1000000000
     * GOLD                                      0.1           5 % (J)
     * SILVER                                    0.01          10 % (K)
     * none                                                    20 %
     */
    
    private int numberOfBands;
    private ColorCode band1;
    private ColorCode band2;
    private ColorCode band3; // not used in 4-band resistors
    private ColorCode band4; // Multiplier
    private ColorCode band5; // Tolerance
    
    ResistorColorCode(
            ColorCode b1,
            ColorCode b2,
            ColorCode b3,
            ColorCode b4,
            ColorCode b5
            )
    {
        numberOfBands = 5;
        band1 = b1;
        band2 = b2;
        band3 = b3;
        band4 = b4;
        band5 = b5;
    }
    
    ResistorColorCode(
            ColorCode b1,
            ColorCode b2,
            ColorCode b4,
            ColorCode b5
            )
    {
        numberOfBands = 4;
        band1 = b1;
        band2 = b2;
        band4 = b4;
        band5 = b5;
    }
    
    public String GetColorCode()
    {
        if (numberOfBands == 4)
        {
            if (band5.tolerance==null)
            {
                return Integer.toString(band1.value) +
                    band2.value +
                    band4.multiplier;
            }
            else
            {
                return Integer.toString(band1.value) +
                    band2.value +
                    band4.multiplier +
                    band5.tolerance;
            }
            
        }
        else
        {
            if (band5.tolerance==null)
            {
                return Integer.toString(band1.value) +
                    band2.value +
                    band3.value + 
                    band4.multiplier;
            }
            else
            {
                return Integer.toString(band1.value) +
                        band2.value +
                        band3.value + 
                        band4.multiplier +
                        band5.tolerance;
            }
        }
    }
}
