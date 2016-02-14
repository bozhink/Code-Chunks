#include <windows.h>
#include <stdio.h>

// DLL function signature
typedef void (*procedure)(int, double*, double*, double*);

int main (int argc, char** argv) {
    procedure add;
    int N = 3;
    double A[N], B[N], C[N];
    int i;
    for (i=0; i<N; i++) {
        A[i] = 1.0*i/2.0;
        B[i] = 2.4*i/5.0;
        C[i] = 0.0;
    }

    // Load DLL file
    HINSTANCE hinstLib = LoadLibrary(TEXT("DLLFunctions.dll"));
    if (hinstLib == NULL) {
        printf("ERROR: unable to load DLL\n");
        return 1;
    }

    // Get procedure pointer
    add = (procedure) GetProcAddress(hinstLib, "Add");
    if (add == NULL) {
         printf("ERROR: unable to find DLL function\n");
         FreeLibrary(hinstLib);
         return 2;
    }

    // Call prodecure
   add(N, A, B, C);
   for (i=0; i<N; i++) {
        printf("(%d) + (%d) = (%d)\n", A[i], B[i], C[i]);
   }
   return 0;
}
