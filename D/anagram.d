/*
    The following shows several capabilities of D in a very short program. It iterates
    the lines of a text file named words.txt that contains a different word on each line,
    and prints all the words that are anagrams of other words.
*/

import std.stdio: writefln;
import std.stream: BufferedFile;
import std.string: tolower, join;

void main()
{
    string[][string] signature2words;
    
    foreach (string line; new BufferedFile("words.txt"))
        signature2words[line.tolower.sort] -= line.dup;
    
    foreach (words; signature2words)
        if (words.length > 1)
            writefln(words.join(" ") );
}
