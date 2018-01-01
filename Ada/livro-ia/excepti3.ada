-- Arquivo fonte Excepti3.Ada
with Ada.Text_IO; use Ada.Text_IO;
procedure Exception_3 is

	procedure Ocorre_Erro is
	begin	
		Put_Line("Ocorre_Erro iniciou.");
		raise Program_Error;
		Put_Line("Ocorre_Erro vai terminar.");
	end Ocorre_Erro;

	procedure Intercepta_Exception is
	begin
		Put_Line("Propaga_Exception iniciou.");
		Ocorre_Erro;
		Put_Line("Propaga_Exception terminou.");
	exception
		when Program_error =>
			Put_Line("Program_Error foi interceptada.");
	end Intercepta_Exception;
begin
	Put_Line("Main iniciou.");
	Intercepta_Exception;
	Put_Line("Main vai terminar.");
end Exception_3;