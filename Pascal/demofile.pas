program DemoFile;
   type
      Kniga=record
         Ime,Avtor:String[30];
         Cena:Real;
      end;
   var
      F: file of Kniga;
      K: Kniga;
      I: Integer;

begin
   assign(F,'Knigi.dat');
   rewrite(F);
   
   for I:=1 to 3 do
   begin
      with K do begin
         writeln('Въведи книга № ',I);
         write('Име -> '); readln(Ime);
         write('Автор -> '); readln(Avtor);
         write('Цена -> '); readln(Cena);
      end;
      
      write(F, K);
   end;
   
   seek(F,0);
   
   writeln('Книгите във файла са: ');
   while not eof(F) do begin
      read(F,K);
      writeln(K.Ime:31, K.Avtor:31, K.Cena:8:2);
   end;
   
   close(F);
end.

