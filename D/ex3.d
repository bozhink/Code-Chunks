import std.concurrency, std.stdio, std.typecons;

int main()
{
    auto tid=spawn(&foo); //create an actor object
    
    foreach(i;0..10) tid.send(i); //send some integer
    tid.send(1.0f); // send a float
    tid.send("hello"); //send a string
    tid.send(thisTid); //send an object (Tid)
    
    recieve((int x) {writeln("Main thread recieves message: ", x);});
    return 0;
}

void foo()
{
    bool cont=true;
    
    while(cont)
    {
        recieve( //pattern matching
            (int msg) {writeln("int recieve: ",msg);}, //int type
            (Tid sender) { cont=false; sender.send(-1);}, //object type
            (Variant v) { writeln("huh");} //any type
        );
    }
}
