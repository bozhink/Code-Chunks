-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte Arv_Exp.Ada
with Ada.Text_IO, Arv_Exp;
use Ada.Text_IO, Arv_Exp;
procedure Arvore_De_Expressao is

	Raiz     : Elo;
begin
	Gera_Expressao("(4+5+6)*7+8*(1+2+3)", Raiz);

	Put_Line("O valor de (4+5+6)*7+8*(1+2+3) e': " &
				Integer'Image(Calcula(Raiz)));
	
end Arvore_De_Expressao;