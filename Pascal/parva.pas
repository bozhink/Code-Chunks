program Parva;

var oz, cz : real;

begin

   repeat
      write('Въведете основна заплата -> ');
      readln(oz);
   until oz>0;
   cz:=oz+oz*21/100;
   cz:=cz-cz*20/100;
   writeln('Чистата заплата ще бъде ', cz:7:2);
end.

