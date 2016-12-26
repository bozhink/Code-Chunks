DLL_Shared_Data example for Intel Visual Fortran

This program demonstrates sharing data between applications using a DLL

The Shared_Globals_DLL project defines some shared variables and builds
them into a DLL with the data section marked read-write.

The DLL_Shared_Data project has a test program, main.f90.  Build this, which
links to Shared_Globals_DLL.  When run, the program starts two instances
of itself, each of which creates a console window (you may need to drag
one of the windows to expose the other.)  The parent window prompts for
a number.  When you type the number, it is stored in the global data and
then the child process wakes up, takes the square root of the number, and
makes that available to the parent process which is then reawakened.  Enter
0 to exit.

The program also demonstrates the use of a Mutex to protect shared data.

--

These samples are provided as a courtesy to users of Intel Visual Fortran.  You may use and
adapt the example sources for whatever purpose you desire. The sample programs are not
supported by Intel, but if you find an error, please let us know at Intel(R) Premier Support.