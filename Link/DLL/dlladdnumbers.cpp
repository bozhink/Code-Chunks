#include <windows.h>

BOOL APIENTRY DllMain(HANDLE hModule, DWORD dwReason, LPVOID lpReserved)
{
    return TRUE;
}

extern "C" __declspec(dllexport) double AddNumbers(double a, double b)
{
    return a+b;
}

extern "C" __declspec(dllexport) void Add(int n,double a[],double b[],double c[])
{
    int i;
    for (i=0;i<n;i++) c[i]=a[i]+b[i];
}
