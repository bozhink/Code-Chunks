program razm (input, output);
var a, b, c: integer;
begin
    write('A = '); readln(a);
    write('B = '); readln(b);
    c:=a;
    a:=b;
    b:=c;
    writeln('A = ', a);
    writeln('B = ', b);
end.
    