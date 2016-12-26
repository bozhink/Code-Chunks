ReadMe for Excel example

This demonstrates calling a Fortran DLL from an Excel macro.
The provided xltest.xls spreadsheet defines a macro that calls the
FortranCall function when the button is pushed.

After building the project, open the xltest.xls spreadsheet
by double-clicking on it, enabling macros, then click the button.

Because Excel requires an explicit path to the DLL, this has been
set as C:\TEMP\FCALL.dll.  If you need to change this, do the
following:

1. Right click on the Fcall project in Visual Studio, and
   select Properties.
2. Click Build Events, then Post-Build Events
3. Edit the Command Line to specify the new destination and click OK.
4. Double-click on xltest.xls. Click Enable Macros when prompted, and then
   No to open the file for writing.
5. Press ALT-F11 to open the Visual Basic editor.
6. Click the + next to "Modules" and then double-click on Module1
7. Edit the path to the DLL to match what you set in the Fortran project
8. Select File..Close to close the editor.
9. Close Excel and save the file.

Copyright (C) 2007 Intel Corporation.  All rights reserved.