-- Arquivo fonte Excepti1.Ada
with Ada.Text_IO; use Ada.Text_IO;
procedure Exception_1 is

	procedure Ocorre_Erro is
	begin	
		Put_Line("Ocorre_Erro iniciou.");
		raise Program_Error;
		Put_Line("Ocorre_Erro vai terminar.");
	end Ocorre_Erro;
begin
	Put_Line("Main iniciou.");
	Ocorre_Erro;
	Put_Line("Main vai terminar.");
end Exception_1;		