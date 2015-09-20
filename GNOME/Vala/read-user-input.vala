// Reading User Input
void main ()
{
    stdout.printf ("Please enter your name: ");
    string name = stdin.read_line();
    if (name != null)
    {
        stdout.printf ("Hello, %s!\n", name);
    }
}
/*
Vala provides the objects stdin (standard input), stdout (standard output)
and stderr (standard error) for the three standard streams.
The printf method takes a format string and a variable number
of arguments as parameters.
*/
