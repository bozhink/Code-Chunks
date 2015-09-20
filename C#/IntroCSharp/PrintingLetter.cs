class PrintingLetters
{
    static void Main(string[] argv)
    {
        System.Console.Write("Enter person name: ");
        string person=System.Console.ReadLine();
        
        System.Console.Write("Enter book name: ");
        string book=System.Console.ReadLine();
        
        string from = "Author Team";
        
        System.Console.WriteLine("\n\n");
        
        System.Console.WriteLine("   Dear {0},",person);
        System.Console.Write("We are plesed to inform " +
            "you that \"{1}\" is the best Bulgarian book. {2}" +
            "The authors of the book wish you good luck {0}!{2}",
            person, book, System.Environment.NewLine);
        
        System.Console.WriteLine("   Yours,");
        System.Console.WriteLine("   {0}", from);
    }
}
