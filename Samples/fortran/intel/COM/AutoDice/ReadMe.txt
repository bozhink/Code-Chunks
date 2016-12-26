AutoDice Sample

This program demonstrates using the COM interface to Microsoft Excel*.
The program simulates rolling two dice a number of times, determining
how often each combination from 2-12 results, and asks Excel to create
a chart with the results.

Additional software required: Microsoft Office 2003*

Build the application and run it.  If prompted to open HISTO.xls as read-only,
select Yes.  The program will then update Chart1 to display a bar chart
summarizing the totals of the dice throws (default 1000 throws).  Close
Excel (and do not save the file) to end.

Using the Fortran Module Wizard to generate the EXCEL module file

One can generate interfaces to all Excel COM members but this produces a 6+MB
source file that takes a long time to compile.  It is best to select just
the required members.  This has already been done in the sample, but if you
wish to recreate it, follow these steps:

1. Tools > Fortran Module Wizard
2. Select COM tab
3. Under Component Name, select Microsoft Excel 11.0 Object Library
4. Check box "Generate code that uses Automation interfaces" and click Next
5. Select the following members:  _Application, _Chart, _Workbook, _Worksheet, 
   Axes, Charts, Range, Workbooks, Worksheets (hold down Ctrl key and click on
   selections)
6. Leave checkboxes unchecked and accept default module name of EXCEL.  
7. Click Finish.  Save file as EXCEL.f90

For information on the Automation interfaces of Microsoft Office*,
see http://support.microsoft.com/ofd

Copyright (C) 2007 Intel Corporation. All Rights Reserved. 

The source code contained or described herein and all documents related to the source code 
("Material") are owned by Intel Corporation or its suppliers or licensors. Title to the 
Material remains with Intel Corporation or its suppliers and licensors.  The Material is 
protected by worldwide copyright laws and treaty provisions. No part of the Material may be 
used, copied, reproduced, modified, published, uploaded, posted, transmitted, distributed, 
or disclosed in any way except as expressly provided in the license provided with the 
Materials.  No license under any patent, copyright, trade secret or other intellectual 
property right is granted to or conferred upon you by disclosure or delivery of the 
Materials, either expressly, by implication, inducement, estoppel or otherwise, except as 
expressly provided in the license provided with the Materials.

* Other names and brands may be claimed as the property of others