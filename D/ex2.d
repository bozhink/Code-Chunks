import std.algorithm, std.range, std.stdio;
int main()
{
    int[] a1=[0,1,2,3,4,5,6,7,8,9];
    int[] a2=[6,7,8,9];
    immutable pivot = 5;
    
    int mysum(int a,int b) pure
    {
        if(b<=pivot) return a+b;
        else return a;
    }
    auto result=reduce!(mysum)(chain(a1,a2)); //passing a delegate closure
    writeln("Result: ",result);
    return 0;
}
