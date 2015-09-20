{
  Created: 10.01.09 22:10:25 by SecondAccount

  $Id: DLL.pas,v 1.1.2.3 2003/08/13 00:38:45 neum Exp $
}

library RND;
{$mode objfpc}{$H+}
uses Math;

  function Rand:Double; export;
  begin
    Rand := Random;
  end;

exports Rand;

begin

end.
