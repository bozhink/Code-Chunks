program Umnojenie (input, output);
var Mnojimo, Mnojitel, Rezultat: Integer;
begin
  write ('Vuvedete mnojimoto: '); 
  readln(Mnojimo);
  write ('Vuvedete mnojitelja: ');
  readln(Mnojitel);
  Rezultat:=Mnojimo*Mnojitel;
  writeln(Mnojimo, '*', Mnojitel, '=', Rezultat);
end.
