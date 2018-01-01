import tango.io.Stdout;

void main(char [][] args)
{
    foreach (i, argv; args)
        Stdout("args[")(i)("] = '")(argv)("'").newline();
}
