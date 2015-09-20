{
  Created: 09.30.09 17:25:47 by SecondAccount

  $Id: DLL.pas,v 1.1.2.3 2003/08/13 00:38:45 neum Exp $
}

library Example;

  function AddNumbers(a, b : Double): Double;
  begin
    AddNumbers := a + b;
  end;

exports AddNumbers;

begin
  WriteLn('Using "Example.dll"...');
end.
