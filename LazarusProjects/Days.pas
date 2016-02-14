program HowManyDays;
type
     InputDate = record
        dd : Integer;
        mm : Integer;
        yy : Integer;
        end;

var
	I : integer;
        A : Char;
        Start : InputDate;

function CountDays(First, Last : InputDate) : Integer;
begin
    if First.dd < 1 then halt;
    CountDays := 0;
end;

begin
    readln(Start.dd, A, Start.mm, A, Start.yy);
    writeln(Start.dd, '/', Start.mm, '/', Start.yy);	
end.