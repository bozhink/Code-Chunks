VB-Calls-Fortran sample
Part of Intel(R) Visual Fortran Compiler

Description
===========

This sample demonstrates how to call a Fortran DLL from Visual BASIC.NET
and how to pass simple arguments.

Build Instructions
==================
 
This project requires that you have Microsoft Visual BASIC.NET installed.  It
will not work if you are using the included Microsoft Visual Studio
Shell.
 
If project "VBCallsFortran" is not shown in boldface type in the Solution Explorer,
right-click on project "VBCallsFortran" and select "Set as StartUp Project".

If you will be building on a 64-bit platform (VS2005 or VS2008 required), you must
create a new "x64" or "Itanium" platform for the solution.  To do this, select Build >
Configuration Manager.  In the "Active solution platform" dropdown select "<New...>".
In the new dialog which appears, indicate the desired new platform (x64 or Itanium)
and for "Copy settings from" select "Mixed Platforms".  Leave the "Create new project
platforms" box checked and click OK and then Close.

To enable debugging of Fortran code called fromn Visual Basic, right click
on project "VBCallsFortran" and then select Properties.  In the left column, select
Configuration Properties > Debugging.  Check the box labeled "Enable unmanaged
code debugging" and click OK.

Build the solution and then run it. A "Do It" button will be displayed along
with four input values.  Click the button.  The VB code will call the Fortran
routine DLL_ROUT and pass it a double precision real input array, a string,
and a double-precision output array.  The Fortran code uses an internal READ
to convert the string to a number, multiplies it by the values in the input
array, and then stores the result in the output array.

To view the Visual BASIC code, open Form1.vb and double-click on the Do It
button.  Note that the VB code passes the first element of the arrays to
Fortran (otherwise it would pass a SafeArray)