{
  Created: 10.05.09 21:05:04 by SecondAccount

  $Id: Pascal\040Console.pas,v 1.1.2.3 2003/08/13 00:38:45 neum Exp $
}

program rundll;
{$APPTYPE CONSOLE}

uses Windows;

procedure ShowHelp;
begin
  WriteLn('Usage: rundll [options] [files] etc.');
  Halt(0);
end;

procedure load(dllname : pChar);
var
  lHandle : HMODULE;
begin
  lHandle := LoadLibrary(dllname);
  if lHandle = 0 then begin
    WriteLn('**');
    WriteLn('ERROR: Can not load the Library ',dllname);
    WriteLn('**');
    Halt(2);
  end;
  FreeLibrary(lHandle);
end;

procedure HandleOptions;
var
  i: integer;
  switch: string;
begin
  if ParamCount > 0 then begin
    i := 1;
    while i <= ParamCount do begin
      switch := ParamStr(i);
      if (switch[1] = '/') or (switch[1] = '-') then begin
        Delete(switch, 1, 1);
        if (switch = '?') or (switch = 'help') or (switch = 'h') then
          ShowHelp
        else if (switch = 'f') or (switch = 'F') then begin
          Inc(i);
          load(pChar(switch));
          end
        else begin
          WriteLn('Unknown Option "' + switch + '"');
          Halt(1);
        end;
      end else begin
        {...}
      end;
      Inc(i);
    end;
  end else
    ShowHelp;
end;

begin
  HandleOptions;
end.

