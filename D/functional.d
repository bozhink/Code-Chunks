import std.algorithm, std.range, std.stdio;

int main()
{
    int [] a1 = [0,1,2,3,4,5,6,7,8,9];
    int [] a2 = [6,7,8,9];
    immutable pivot = 5; // must be immutable to allow access from inside mysum
    
    int mysum(int a, int b) pure // pure function
    {
        if (b<=pivot) // ref to enclosing-scope
            return a+b;
        else
            return a;
    }
    
    auto result = reduce!(mysum) ( chain(a1,a2) ); // passing a delegate (closure)
    writeln("Result: ",result); // output is "15"
    return 0;
}
