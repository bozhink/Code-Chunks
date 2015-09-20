program Example;
 
{$APPTYPE CONSOLE}
 
uses Windows;
 
var
	AddNumbers	: function (a, b: Double): Double;
	LibHandle  	: HMODULE;
 
begin
	LibHandle := LoadLibrary('lib.dll');
 
	if LibHandle = 0 then
	Exit;
 
	AddNumbers := GetProcAddress(LibHandle, 'AddNumbers');
 
	if Assigned( AddNumbers ) then
	Writeln( '1 + 2 = ', AddNumbers( 1, 2 ) );
	else
	Writeln('Error: unable to find DLL function');
 
	FreeLibrary(LibHandle);
end.