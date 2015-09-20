#include <windows.h>
 
// DLL entry function (called on load, unload, ...)
BOOL APIENTRY DllMain(HANDLE hModule, DWORD dwReason, LPVOID lpReserved)
{
    return TRUE;
}
 
// Exported function - adds two numbers
extern "C" __declspec(dllexport) double AddNumbers(double a, double b)
{
    return a + b;
}
