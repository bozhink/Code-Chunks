-- Arquivo fonte PredSucc.Ada
with Ada.Text_IO; use Ada.Text_IO;
procedure Pred_Succ is

	type Dias_Da_Semana is
		(Segunda, Terca, Quarta
		,Quinta, Sexta, Sabado, Domingo);

	package Dias_IO is new Enumeration_IO(Dias_Da_Semana);

	Dia : Dias_Da_Semana;
begin
	Dia := Dias_Da_Semana'Pred(Terca);
	Put_Line("Os dias de trabalho sao: ");
	while Dia /= Sabado loop
		Dias_IO.Put(Dia);
		New_Line;
		Dia := Dias_Da_Semana'Succ(Dia);
	end loop;
	Put_Line("Os dias de folga sao: ");
	loop
		Dias_IO.Put(Dia);
		New_Line;
		exit when Dia = Domingo;
		Dia := Dias_Da_Semana'Succ(Dia);
	end loop;
end Pred_Succ;	
