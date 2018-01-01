using System;

/*
 * Task 1. class_123 in C#
 *
 *  Refactor the following examples to produce code with well-named C# identifiers.
 */

namespace NamingIdentifiersHomework
{
    public class ConsolePrinter
    {
        const int maxCount = 6;

        private class GeneralPrintMethods
        {
            public void PrintBooleanToConsole(bool toBePrinted)
            {
                string toBePrintedAsString = toBePrinted.ToString();
                Console.WriteLine(toBePrintedAsString);
            }
        }

        public static void PrintTrue()
        {
            ConsolePrinter.GeneralPrintMethods printer =
              new ConsolePrinter.GeneralPrintMethods();
            printer.PrintBooleanToConsole(true);
        }
    }
}
