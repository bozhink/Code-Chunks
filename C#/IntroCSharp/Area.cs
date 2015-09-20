class CalculatingArea
{
    static void Main()
    {
        System.Console.WriteLine("This program calculates " +
                       "the area of a rectangle or a triangle");
        
        System.Console.WriteLine("Enter a and b (for rectangle) " +
                       "or a and h (for triangle):");
                       
        int a = int.Parse(System.Console.ReadLine());
        int b = int.Parse(System.Console.ReadLine());
        
        System.Console.WriteLine("Enter 1 for a rectangle or " +
                       "2 for a triangle: ");
        
        int choice = int.Parse(System.Console.ReadLine());
        double area = (double) (a*b) / choice;
        System.Console.WriteLine("The area of your figure is " + area);
    }
}