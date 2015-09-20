// Game Classic: Number Guessing
// Requires at least Vala 0.7.5 (for stdin.read_line() support)
/*
$ valac number-guessing.vala
$ ./number-guessing.vala
*/

public class NumberGuessing
{
    private int min;
    private int max;
    
    public NumberGuessing(int min, int max)
    {
        this.min = min;
        this.max = max;
    }
    
    public void start ()
    {
        int tryCount = 0;
        int number = Random.int_range(min, max);
        
        stdout.printf ("Welcome to Number Guessing!\n\n");
        stdout.printf ("I have thought up a number between %d and %d\n", min, max);
        stdout.printf ("which you have to guess now. Don't worry, I will\n");
        stdout.printf ("give you some hints.\n\n");
        
        while (true)
        {
            tryCount++;
            
            stdout.printf ("Try #%d\n", tryCount);
            stdout.printf ("Please enter a number between %d and %d: ", min, max);
            int input = int.parse (stdin.read_line ());
            
            if (number == input)
            {
                stdout.printf ("Congratulations! You win.\n");
                break;
            }
            else
            {
                stdout.printf ("Wrong. The wanted number is %s than %d.\n",
                               number > input ? "greater" : "less", input);
            }
        }
    }
    
    public static int main (string[] args)
    {
        var game = new NumberGuessing (1, 100);
        game.start ();
        return 0;
    }
}
