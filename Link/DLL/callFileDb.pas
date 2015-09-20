{
  Created: 10.11.09 22:42:41 by SecondAccount

  $Id: Pascal\040Console.pas,v 1.1.2.3 2003/08/13 00:38:45 neum Exp $
}

program callFileDb;
{$APPTYPE CONSOLE}

procedure Init(fn:String);external 'filedb.dll';

begin
  Init('e:\x.dat');
end.
