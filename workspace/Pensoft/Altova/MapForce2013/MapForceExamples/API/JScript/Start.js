
// Initialize application's COM object. This will start a new instance of the application and
// return its main COM object. Depending on COM settings, a the main COM object of an already
// running application might be returned.

try {	objMapForce = WScript.GetObject("", "MapForce.Application");	}
catch(err) {}

if( typeof( objMapForce ) == "undefined" )
{
	try	{	objMapForce = WScript.GetObject("", "MapForce_x64.Application")	}
	catch(err)
	{
		WScript.Echo( "Can't access or create MapForce.Application" );
		WScript.Quit();
	}
}

// if newly started, the application will start without its UI visible. Set it to visible.
objMapForce.Visible = true;

WScript.Echo(objMapForce.Edition + " has successfully started. ");

objMapForce.Visible = false; // will shutdown application if it has no more COM connections
//objMapForce.Visible = true;	// will keep application running with UI visible


