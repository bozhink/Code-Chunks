// Command-Line Arguments and Exit Code
//
// The first command line argument (args[0]) is always the invocation of the program itself.
//
int main(string[] args)
{
    // Output the number of arguments
    stdout.printf("%d command line argument(s):\n", args.length);
    
    // Enumerate all command line arguments
    foreach (string arg in args)
    {
        stdout.printf("%s\n", arg);
    }
    
    // Exit code (0: success, 1: failure)
    return 0;
}

