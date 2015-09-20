// Using explicit run-time linking
#include <windows.h>
#include <stdio.h>

// DLL function signature
typedef double (*importFunction)(double,double);

int main(int argc,char**argv)
{
    importFunction addNumbers;
    double result;
    
    // Load DLL file
    HINSTANCE hinstLib = LoadLibrary(TEXT("Example.dll"));
    if (hinstLib == NULL)
    {
        printf("ERROR: unable to load DLL\n");
        return 1;
    }
    
    // Get function pointer
    addNumbers = (importFunction) GetProcAddress(hinstLib,"AddNumbers");
    if (addNumbers == NULL)
    {
        printf("ERROR: unable to find DLL function\n");
        FreeLibrary(hinstLib);
        return 2;
    }
    
    // Call function.
    result = addNumbers(1,2);
    
    // Unload DLL file
    FreeLibrary(hinstLib);
    
    // Display result
    printf("The result was : %f\n", result);
    
    return 0;
}
