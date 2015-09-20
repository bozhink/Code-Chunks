{
  Created: 09.30.09 17:48:22 by SecondAccount

  $Id: Pascal\040Console.pas,v 1.1.2.3 2003/08/13 00:38:45 neum Exp $
}

program Delphi_Explicit_run_time_linking;
{$APPTYPE CONSOLE}
uses Windows;

type
  TFunc = function(a, b : Double): Double;
  TLibMain = procedure(hInstDLL:DWORD; reason:DWORD; unused:DWORD);

var
  AddNumbers : TFunc;
  lMain      : TLibMain;
  LibHandle  : HMODULE;

begin
  LibHandle := LoadLibrary('Example.dll');

	if LibHandle = 0 then Exit;

	AddNumbers := TFunc(GetProcAddress(LibHandle, 'AddNumbers'));

	if Assigned( AddNumbers ) then
	  Writeln( '1 + 2 = ', AddNumbers( 1, 2 ) )
	else
	  Writeln('Error: unable to find DLL function');
	  
  lMain := TLibMain( GetProcAddress(LibHandle, 'LibMain') );
  


	FreeLibrary(LibHandle);
end.
