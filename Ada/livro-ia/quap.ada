-- (C) 1996 Arthur Vargas Lopes
-- Arquivo fonte QuaP.Ada
with Ada.Text_IO, Ada.Integer_Text_IO;
procedure Quarto_Programa is

	Valor_Lido : Integer; -- Armazena e individualiza um valor inteiro. 

begin
	Ada.Text_IO.Put("Tecle um numero inteiro: ");

	Ada.Integer_Text_IO.Get(Valor_Lido); -- Transfere um número do teclado para Valor_Lido

	Ada.Text_IO.New_Line;
	Ada.Text_IO.Put("O numero inteiro lido foi ");

	Ada.Integer_Text_IO.Put(Valor_Lido,3); -- Exibe na tela o conteúdo de Valor_Lido

	Ada.Text_IO.New_Line;
end Quarto_Programa;