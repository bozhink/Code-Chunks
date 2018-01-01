import std.stdio : writefln;

void main(string[] args)
{
    foreach (i, argv; args)
        writefln("argv[%d] = '%s'", i, argv);
}
