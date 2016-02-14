program TableOfMultiplication;
var
	I, J : Integer;

begin
for I:=1 To 10 do
  begin
    for J:=1 To 10 do
      begin
        write(I,'x',J,'=',I*J,'  ');
      end;
    writeln('');
  end;
	
end.