import std.concurrency, std.stdio, std.typecons;

int main()
{
    auto tid = spawn(&foo); // spawn a new thread running foo()
    
    foreach (i; 0 .. 10) tid.send(i); // send some integer
    tid.send(1.0f); // send a float
    tid.send("hello"); // send a string
    tid.send(thisTid); // send a struct (Tid)
    
    receive( (int x) { writeln("Main thread receives message: ", x); } );
    
    return 0;
}

void foo()
{
    bool cont = true;
    while (cont)
    {
        receive ( // delegates are used to match the message type
            (int msg) { writeln("int received: ", msg); },
            (Tid sender) { cont = false; sender.send(-1); },
            (Variant v) { writeln("huh?"); } // Variant matches any type
        );
    }
}
