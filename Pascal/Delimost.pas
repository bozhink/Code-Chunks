program Delimost;
   var IntNum : Integer;
begin
   write('Въведете цяло число -> ');
   readln(IntNum);
   
   write('Числото ',IntNum:6);
   
   if (IntNum mod 5) = 0 then
      begin
         write(' се дели на 5');
         if (IntNum mod 3) = 0 then
            writeln(' и се дели на 15')
         else writeln(' и не се дели на 15');
      end
   else writeln(' не се дели на 5 и на 15');
end.

