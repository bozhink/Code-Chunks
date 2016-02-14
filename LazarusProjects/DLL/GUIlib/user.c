#include <windows.h>
#include <stdio.h>

// DLL function signature
typedef void (*proc)();

int main (int argc, char** argv) {
    proc dorun;

    // Load DLL file
    HINSTANCE hinstLib = LoadLibrary(TEXT("guilib.exe"));
    if (hinstLib == NULL) {
        printf("ERROR: unable to load DLL\n");
        return 1;
    }

    // Get procedure pointer
    dorun = (proc) GetProcAddress(hinstLib, "doRun");
    if (dorun == NULL) {
         printf("ERROR: unable to find DLL function\n");
         FreeLibrary(hinstLib);
         return 2;
    }

    // Call prodecure
   dorun();
   return 0;
}
