{
  Created: 10.04.09 23:54:17 by SecondAccount

  $Id: Pascal\040Console.pas,v 1.1.2.3 2003/08/13 00:38:45 neum Exp $
}

program Empty_Recycle_Bin;
{$APPTYPE CONSOLE}
{$MODE Delphi}

uses
  Windows, Messages, SysUtils, Classes,ShellApi;

function SHEmptyRecycleBin(Wnd:HWnd; LPCTSTR:PChar; DWORD:Word):Integer; stdcall;

const
     SHERB_NOCONFIRMATION   = $00000001;
     SHERB_NOPROGRESSUI     = $00000002;
     SHERB_NOSOUND          = $00000004;

{$R *.DFM}

procedure SHEmptyRecycleBin; external 'SHELL32.DLL' name 'SHEmptyRecycleBinA';

// ---------------------------------------------------------- //
procedure EmptyRecycleBin();
begin
     SHEmptyRecycleBin(self.handle,'',SHERB_NOCONFIRMATION);
end;
// ---------------------------------------------------------- //
begin
  EmptyRecycleBin();
end.

