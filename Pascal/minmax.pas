program Max_Min;
   const N=12;
   type TipIndex=1..N;
   var 
       Oborot : array[TipIndex] of Real;
       max, min : Real;
       I:TipIndex;
begin
   for I:=1 to N do
   begin
      write('Въведете оборота за месец ',I,' -> ');
      readln(Oborot[I]);
   end;

   max:=Oborot[1];
   min:=Oborot[1];
   
   for I:=2 to N do
   begin
      if Oborot[I]>max then max:=Oborot[I];
      if Oborot[I]<min then min:=Oborot[I];
   end;
   
   writeln('Максималният оборот е ',max:6:12);
   writeln('Мивималният оборот е ',min:6:12);
end.

