//	Javascript usage example for AltovaXML
// 	Purpose: 
// -  Generate an AltovaXML application object
//  - Use the XSLT2 engine to copy the input instance 

// Determine location of Program Files (needed later for locating the example files)
objWshShell = WScript.CreateObject("WScript.Shell");
strProgFilesFolder = objWshShell.ExpandEnvironmentStrings("%ProgramFiles(x86)%")


// start AltovaXML
try {	objAltovaXML = WScript.GetObject("", "AltovaXML.Application");	}
catch(err) {}

if( typeof( objAltovaXML ) == "undefined" )
{
	// 64-bit installation
	strProgFilesFolder = strProgFilesFolder.replace( " (x86)", "" );
	try	{	objAltovaXML = WScript.GetObject("", "AltovaXML_x64.Application")	}
	catch(err)
	{
		WScript.Echo( "Can't access or create AltovaXML.Application" );
		WScript.Quit();
	}
}


// Locate examples via default installation path. The path needs to be adapted to major 
// release versions or alternate installation locations.
strExampleFolder = strProgFilesFolder + "\\Altova\\AltovaXML2013\\AltovaXMLExamples\\";

// acess XSLT 2.0 engine
var xslt2 = objAltovaXML.XSLT2;

xslt2.XSLFileName = strExampleFolder + "CopyInputXSLT2.xsl";
xslt2.InputXMLFileName = strExampleFolder + "simple.xml";

try 
{
	 xslt2.Execute(strExampleFolder + "API\\JScript\\OutJavaScript.xml"); 
}
catch(err)
{
	WScript.Echo( "Error:", xslt2.LastErrorMessage );
};
