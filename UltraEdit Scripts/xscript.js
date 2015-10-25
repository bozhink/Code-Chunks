//This script requires UltraEdit v13.10 or UEStudio v6.30 or any later.

//Get user input
var i=55;

//Clear the output window, make it visible and disable status information.
UltraEdit.outputWindow.showStatus=false;
UltraEdit.outputWindow.clear();
if (UltraEdit.outputWindow.visible == false) {
  UltraEdit.outputWindow.showWindow(true);
}


for (i=55; i<113; i++) {
  UltraEdit.outputWindow.write( "<xref ref-type=\"fig\" rid=\"F" + i + "\"></xref>"   );
}

