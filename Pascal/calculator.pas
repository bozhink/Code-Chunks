program calculator;

var a, b: integer;

begin
    write('a='); readln(a);
    write('b='); readln(b);
    writeln(a, '+', b, '=', a + b);
    writeln(a, '-', b, '=', a - b);
    writeln(a, ' div ', b,' ', a div b);
    writeln('Остатъкът от деленето на ', a, ' и ', b, ' e ', a mod b);
end.

