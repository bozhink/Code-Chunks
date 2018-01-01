-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte Arv_Exp2.Ada
with Ada.Text_IO, Dos.Screen, Arv_Exp;
use Ada.Text_IO, Dos.Screen, Arv_Exp;
procedure Arvore_De_Expressao_E_Desenho is

	Raiz     : Elo;

	procedure Desenha_Expressao(R : Elo; Nivel, Pos : Integer) is
		F : Integer;
	begin
		if R /= null then
			if Nivel = 1 then
				F := 11;	
			elsif Nivel = 2 then
				F := 5;	
			else
				F := 2;
			end if;
			Desenha_Expressao(R.Esq,Nivel+1,Pos-Nivel*F);
			GotoXY(Abs(Pos),Nivel*2);
			Put(R.Op_Val);
			Desenha_Expressao(R.Dir,Nivel+1,Pos+Nivel*F);
		end if;
	end Desenha_Expressao; 
begin
	Set_Cursor_Off; -- Desativa o cursor
	Cls;            -- Limpa a tela

	Gera_Expressao("(4+5+6)*7+8*(1+2+3)", Raiz);

	GotoXY(0,0);
	Put_Line("O valor de (4+5+6)*7+8*(1+2+3) e': " &
				Integer'Image(Calcula(Raiz)));
	
	Desenha_Expressao(Raiz,1,40);
	GotoXY(1,23);
	Put("Tecle qualquer caractere para continuar...");
	Get_Immediate(Raiz.Op_Val);
	Set_Cursor_On; -- Ativa o cursor
	New_Line;
end Arvore_De_Expressao_E_Desenho;