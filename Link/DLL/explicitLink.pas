program ExplicitLink;
{Using Explicit Run-Time Linking}

{$APPTYPE CONSOLE}

uses Windows;

var
   AddNumbers : function (a,b:Double):Double; cdecl;
   LibHandle  : HMODULE;

begin
   LibHandle := LoadLibrary('example.dll');
   
   if LibHandle = 0 then Exit;
   
   AddNumbers := GetProcAddress(LibHandle, 'AddNumbers');
   
   if Assigned(AddNumbers) then
      WriteLn('1 + 2 = ', AddNumbers(1,2))
   else
      WriteLn('Error: unable to find DLL function');
   
   FreeLibrary(LibHandle);
end.
