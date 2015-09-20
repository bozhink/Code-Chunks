program Firma;

const N=12;

type
   TipIndex = 1..N;
   
var
   Oborot : array[TipIndex] of Real;
   S: Real;
   I: TipIndex;
   
begin

   for I := 1 to N do
      begin
         write('Въведете оборота за месец ', I,'->');
         readln(Oborot[I]);
      end;
      
   S := 0;
   for I := 1 to N do
      S := S + Oborot[I];
   S := S / N;
   
   writeln('Средната стойност на оборота е: ', S:6:2);
end.

