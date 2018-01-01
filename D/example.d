import std.stdio: writefln;
import std.stream: BufferedFile;
import std.string: tolower,join;

void main(string[] args)
{
    string[][string] signature2words;
    
    foreach (string line; new BufferedFile(args[1]))
        signature2words[line.tolower.sort] ~= line.dup;
        
    foreach ( string words; signature2words)
        if (words.length > 1)
            writefln(words.join(" "));
}