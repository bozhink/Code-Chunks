//This script requires UltraEdit v13.10 or UEStudio v6.30 or any later.

//Get user input
var findStr;
var x = 0;
var lineNum;
var found;

//Clear the output window, make it visible and disable status information.
UltraEdit.outputWindow.showStatus=false;
UltraEdit.outputWindow.clear();
if (UltraEdit.outputWindow.visible == false) {
  UltraEdit.outputWindow.showWindow(true);
}

//Make sure we start at the beginning of the file
UltraEdit.activeDocument.top();

// prompt for the search value
findStr = UltraEdit.getString("Please Enter Phrase to search",1);

UltraEdit.outputWindow.write("");
UltraEdit.outputWindow.write("--- Search String ---");
UltraEdit.outputWindow.write("You searched for \"" + findStr + "\"");
UltraEdit.outputWindow.write("");

UltraEdit.activeDocument.findReplace.find(findStr);

//loop to end of file
while (!(UltraEdit.activeDocument.isEof())) {
  if (UltraEdit.activeDocument.isFound()) {
    lineNum = UltraEdit.activeDocument.currentLineNum;
    UltraEdit.activeDocument.key("HOME");
    if (UltraEdit.activeDocument.isColNumGt(1)) { UltraEdit.activeDocument.key("HOME"); }
    UltraEdit.activeDocument.startSelect(); UltraEdit.activeDocument.key("END");
    found = UltraEdit.activeDocument.selection;
    UltraEdit.activeDocument.endSelect();
    UltraEdit.outputWindow.write("Line number: " + lineNum + "\tMatched expression = \t\t\t" + found);
    ++x;
  } else {
    UltraEdit.activeDocument.bottom();
    break;
  }
  UltraEdit.activeDocument.findReplace.find(findStr);
}

UltraEdit.outputWindow.write("---------------------------------------");
UltraEdit.outputWindow.write("Total number of \"" + findStr + "\" is: " + x );
