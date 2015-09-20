// This example shows file manipulation routines: it echoes 
// the contents of itself (the script file). 
// Created with Antechinus® JavaScript Editor 
// Copyright© 2009 C Point Pty Ltd 

fh = fopen(getScriptPath(), 0); // Open the file for reading 
 if(fh!=-1) // If the file has been successfully opened 
 { 
     length = flength(fh);         // Get the length of the file     
     str = fread(fh, length);     // Read in the entire file 
     fclose(fh);                    // Close the file 
      
// Display the contents of the file     
     write(str);     
 }
 
// This example shows folder manipulation routines: it lists 
// the contents of the current folder. 
// Created with Antechinus® JavaScript Editor 
// Copyright© 2009 C Point Pty Ltd 

write("The contents of " + getCurrentFolder()); 

fileName = findFirstFile("*.*"); // Find the first file matching the filter 
 while(fileName.length) 
 { 
     write(fileName); 
     fileName = findNextFile();  // Find the next file matching the filter 
 }
 
 /////////////////////////////////////////////////////////////////////////
 function WriteFile()
 {

var fh = fopen("c:\\MyFile.txt", 3); // Open the file for writing

if(fh!=-1) // If the file has been successfully opened
 {
     var str = "Some text goes here...";
     fwrite(fh, str); // Write the string to a file
     fclose(fh); // Close the file 
 } 

 }

WriteFile();

//////////////////////////////////////////////////////////////////////
<HTML> 
<HEAD> 

<SCRIPT language=JavaScript> 

 function ShowAvailableDrives() 
 { 
     document.write(GetDriveList()); 
 } 

 function GetDriveList() 
 { 
  var fso, s, n, e, x; 
  fso = new ActiveXObject("Scripting.FileSystemObject"); 
  e = new Enumerator(fso.Drives); 
  s = ""; 
  do 
  { 
    x = e.item(); 
    s = s + x.DriveLetter; 
    s += ":-    "; 
    if (x.DriveType == 3)     n = x.ShareName; 
    else if (x.IsReady)     n = x.VolumeName; 
    else                     n = "[Drive not ready]"; 
    s += n + "<br>"; 
    e.moveNext(); 
  }  while (!e.atEnd()); 
   
  return(s); 
 }

 </SCRIPT>
</HEAD>

<BODY>
<P>
<SCRIPT language=JavaScript> ShowAvailableDrives(); </SCRIPT>
</P>
</BODY>
</HTML>

//////////////////////////////////////////////////////////////////////////////
<HTML> 
<HEAD> 

<SCRIPT language="JavaScript">

 function WriteFile() 
 {
   var fso  = new ActiveXObject("Scripting.FileSystemObject"); 
    var fh = fso.CreateTextFile("c:\\Test.txt", true); 
    fh.WriteLine("Some text goes here..."); 
    fh.Close(); 
 }

 </SCRIPT>
</HEAD>

<BODY>
<P>
<SCRIPT language="JavaScript">  WriteFile(); </SCRIPT>
</P>
</BODY>
</HTML>