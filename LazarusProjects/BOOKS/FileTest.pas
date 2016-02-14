program FileTest;
{$APPTYPE CONSOLE}
const
  HWFile = 'Hello.dat';
type
  HW = String[14];
  FHW = File of HW;

var
  Hello : HW;
  Hell2 : HW;
  fp    : FHW;
  I,N   : Integer;

begin
  Hello := 'Hello, World!';
  assign(fp,HWFile);
  WriteLn('File overwitten...');
  rewrite(fp);
  for I := 1 to 20 do write(fp, Hello);
  close(fp);
  WriteLn('File closed.');
  WriteLn('Open file again...');

  reset(fp);
  N := filesize(fp);
  WriteLn(N);
  for I := 0 to N-1 do begin
    Read(fp, Hell2);
    WriteLn(Hell2);
  end;
  seek(fp, 4);
  write(fp, '--------------');
  seek(fp,0);
  WriteLn('++++++++++++++++++++++');
  N := filesize(fp);
  WriteLn(N);
  for I := 0 to N-1 do begin
    Read(fp, Hell2);
    WriteLn(Hell2);
  end;
  write(fp, '--------------');
  seek(fp,0);
  WriteLn('++++++++++++++++++++++');
  N := filesize(fp);
  WriteLn(N);
  for I := 0 to N-1 do begin
    Read(fp, Hell2);
    WriteLn(Hell2);
  end;
  close(fp);
  {ReadLn();}
end.
