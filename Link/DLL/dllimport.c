#include <windows.h>
#include <stdio.h>

// Import function that adds two numbers
// extern "C"
#ifdef __cplusplus
extern "C" {
#endif

__declspec(dllimport) double AddNumbers(double a, double b);
__declspec(dllimport) double __cdecl MultNumbers(double a, double b);

#ifdef __cplusplus
}
#endif

int main(int argc, char **argv)
{
    double result = AddNumbers(1, 2);
    printf("The result was: %f\n", result);
    result = MultNumbers(3,5);
    printf("The result was: %f\n",result);
    return 0;
}
