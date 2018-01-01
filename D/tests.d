#!/usr/bin/rdmd
/* shebang is supported */
/* Hello World in D
   To compile:
      dmd hello.d (or on Unix just make hello.d executable and run it)
      or to optimize:
         dmd -O -inline -release hello.d
*/

import std.stdio;

void main(string[] args)
{
    writeln("Hello World, Reloaded");
    
    // auto type interface and built-iin foreach
    foreach (argc, argv; args)
    {
        // Object oriented programming
        auto cl = new CmdLin(argc,argv);
        // Improved typesafe printf
        writeln(cl.argnum, cl.suffix, " arg: ", cl.argv);
        //Automatic or explicit memory managment
        delete cl;
    }
    
    // Nested structs and classes
    struct specs
    {
        // all members automatically initialized
        size_t count, allocated;
    }
    
    // Nested functions can refer to outer variables like args
    specs argspecs()
    {
        specs* s = new specs;
        // no need for '->'
        s.count = args.length; // get length of array with .length
        s.allocated = typeof(args).sizeof; // built-in native type properties
        foreach(argv; args)
            s.allocated += argv.length*typeof(argv[0]).sizeof;
            return*s;
    }
    
    // built-in string and common string operations
    writefln("argc = %d, " ~ "allocated = %d", argspecs().count, argspecs().allocated);
}

class CmdLin
{
    private size_t _argc;
    private string _argv;
public:
    this(size_t argc, string argv)
    {
        _argc = argc;
        _argv = argv;
    }
    
    size_t argnum()
    {
        return _argc+1;
    }
    
    string argv()
    {
        return _argv;
    }
    
    string suffix()
    {
        string suffix = "th";
        switch (_argc)
        {
            case 0: suffix="st"; break;
            case 1: suffix="nd"; break;
            case 2: suffix="rd"; break;
            default : break;
        }
        return suffix;
    }
}
