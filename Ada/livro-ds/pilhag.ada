-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte PilhaG.Ada
with Ada.Text_IO, Ada.Integer_Text_IO, PilhaG; 
use  Ada.Text_IO, Ada.Integer_Text_IO;
procedure Testa_PilhaG is

	-- Instancia o package genérico PilhaG com o tipo
	-- Integer para 10 elementos
	package Pilha_Integer is new PilhaG(Integer,10);
	use Pilha_Integer; -- Torna Pilha_Integer Visível
	
	Resultado : Integer;	-- Resultado da avaliação
	Exp       : constant String := "45+6+7*812+3+*+";
begin
	Avalia_Posfix(Exp,Resultado);
	Put("O resultado da avaliacao de '" & Exp & "' e': ");
	Put(Resultado,1);
	New_Line;	
end Testa_PilhaG;