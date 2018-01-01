-- Arquivo fonte Excepti2.Ada
with Ada.Text_IO; use Ada.Text_IO;
procedure Exception_2 is

	procedure Ocorre_Erro is
	begin	
		Put_Line("Ocorre_Erro iniciou.");
		raise Program_Error;
		Put_Line("Ocorre_Erro vai terminar.");
	end Ocorre_Erro;

	procedure Propaga_Exception is
	begin
		Put_Line("Propaga_Exception iniciou.");
		Ocorre_Erro;
		Put_Line("Propaga_Exception terminou.");
	end Propaga_Exception;
begin
	Put_Line("Main iniciou.");
	Propaga_Exception;
	Put_Line("Main vai terminar.");
end Exception_2;		