{
  Created: 10.06.09 22:12:30 by SecondAccount

  $Id: DLL.pas,v 1.1.2.3 2003/08/13 00:38:45 neum Exp $
}

library filedb;

type
  {Type Main Object}
  TMO = record
    Content : String[30];
    end;
  {Type Main Object File}
  TMOF = file of TMO;
  
  procedure Init(fn : string);
  var
    fp : TMOF; //file pointer
    cr : TMO;  //carrier
  begin
    cr.Content := '0';
    assign(fp,fn);
    rewrite(fp);
    write(fp,cr);
    close(fp);
  end;
  

exports Init;

begin
  //Init('E:\\x.dat');
end.
