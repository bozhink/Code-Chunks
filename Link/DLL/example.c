#include <windows.h>
#include <stdio.h>
 
// Import function that adds two numbers
extern "C" __declspec(dllimport) double AddNumbers(double a, double b);
 
int main(int argc, char *argv[])
{
    double result = AddNumbers(1, 2);
    printf("The result was: %f\n", result);
    return 0;
}