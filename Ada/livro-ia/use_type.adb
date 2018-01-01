-- Arquivo fonte Use_Type.Adb
with Ada.Text_IO, Ada.Float_Text_IO; 
use Ada.Text_IO, Ada.Float_Text_IO;
package body Matrizes is

	procedure Le_Matriz(M : out Matriz) is
	begin
		Put_Line("Entre" & Integer'Image(M'Length(2)) &
		         " valores para cada uma das" &
		         Integer'Image(M'Length) & " linhas");
		for Linha in M'Range loop
			Put("Linha " & Integer'Image(Linha) &
			    ": ");			
			for Coluna in M'Range(2) loop
				Get(M(Linha,Coluna));
			end loop;
		end loop;
	end Le_Matriz;

	function Soma(M : Matriz; Linha : Integer) return Float is
		Resultado : Float := 0.0;
	begin
		for Coluna in M'Range(2) loop
			Resultado := Resultado + M(Linha,Coluna);
		end loop;
		return Resultado;
	end Soma;
		
	function Soma(M : Matriz) return Float is
		Resultado : Float := 0.0;
	begin
		for Linha in M'Range loop
			for Coluna in M'Range(2) loop
				Resultado := Resultado + M(Linha,Coluna);
			end loop;
		end loop;
		return Resultado;
	end Soma;
		
end Matrizes;