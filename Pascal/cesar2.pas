program Cesar;
   const K=3;
   var
      InpText, KodText: String;
      Alphabet: String;
      I: integer;
begin
   Alphabet:='abcdefghijklmnopqrstuvwxyz';
   Alphabet:=Alphabet + Copy(Alphabet,1,K);

   writeln('Въведете текст от малки латински букви: ');
   readln(InpText);
   
   KodText:='';
   for i:=1 to Length(InpText) do
      KodText:=KodText+Alphabet[Pos(InpText[i],Alphabet) + K];
   
   writeln('Кодираният текст е: ', KodText);
end.

