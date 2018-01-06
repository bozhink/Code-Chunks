// Example for a C# function that is called by a MapForce mapping
// If you make changes to this file, rebuild the included solution "Format.sln" with Visual Studio.

using System;

public class Format
{
    public static string FormatNumber(decimal number)
    {
        return number.ToString("#,##0.00");
    }
}
