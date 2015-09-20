class CircArea
{
    static void Main(string[] args)
    {
        double pi = 3.141592654;
        double r=0.0;
        double area=0.0;
        bool parsed=false;
        
        System.Console.WriteLine("This program calculates the area of a circle");
        
        if (args.Length >=1)
        {
            //System.Console.WriteLine(args[0]);
            parsed = double.TryParse(args[0],out r);
        }
        else
        {
            System.Console.Write("Enter radius: ");
            parsed = double.TryParse(System.Console.ReadLine(),out r);
        }
        
        area = 2.0*r*pi;
        System.Console.WriteLine(
            parsed ? "area = " + area : "Invalid radius!"
        );
    }
}