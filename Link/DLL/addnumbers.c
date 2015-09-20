#include <windows.h>
 
// DLL entry function (called on load, unload, ...)
BOOL APIENTRY DllMain(HANDLE hModule, DWORD dwReason, LPVOID lpReserved)
{
    return TRUE;
}
 
// Exported function - adds two numbers
#ifdef __cplusplus
extern "C" {
#endif

__declspec(dllexport) double AddNumbers(double a, double b)
{
    return a + b;
}

__declspec(dllexport) double __cdecl MultNumbers(double a, double b)
{
    return a*b;
}

#ifdef __cplusplus
}
#endif


