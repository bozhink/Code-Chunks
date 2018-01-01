namespace GameFifteen
{
    using System;

    public class WalkInMatrix
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Enter a positive number ");
            string input = Console.ReadLine();
            int n = 0;
            while (!int.TryParse(input, out n) || n < 0 || n > 100)
            {
                Console.WriteLine("You haven't entered a correct positive number");
                input = Console.ReadLine();
            }

            MatrixWalker matrixWalker = new MatrixWalker(n);
            matrixWalker.Run();
        }
    }
}
