library Add;
    function AddNumbers(a,b:const Real) : Real;
    begin
        WriteLn('You are using AddNumbers() from library Add.');
        AddNumbers := a+b;
    end;

exports AddNumbers;

begin
    WriteLn('Library loaded');
end.

