-- Arquivo fonte If.Ada
with Ada.Text_IO; use Ada.Text_IO;
procedure Comando_If is
	I : Integer ;
begin
	I := 1;
	while I < 5 loop
		Ada.Text_IO.Put_Line("I =" & Integer'Image(I));
		if I = 1 then 
			Put_Line("A condicao 1 e' true");
		elsif I = 2 then
			Put_Line("A condicao 1 e' false");
			Put_Line("A condicao 2 e' true");
		elsif I = 3 then
			Put_Line("A condicao 1 e' false");
			Put_Line("A condicao 2 e' false");
			Put_Line("A condicao 3 e' true");
		else
			Put_Line("A condicao 1 e' false");
			Put_Line("A condicao 2 e' false");
			Put_Line("A condicao 3 e' false");
			Put_Line("A clausula else foi executada.");
		end if;
		I := I + 1;
	end loop;
end Comando_If;
