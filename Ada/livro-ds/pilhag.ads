-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte PilhaG.Ads

generic
	type Tipo is private;
	Max : Integer;
package PilhaG is
	subtype Intervalo_Pilha is Integer range 1 .. Max;

	-- Declara��o de um tipo array
	type Vetor_De_Elementos is array(Intervalo_Pilha) of Tipo;

	-- Declara o tipo Pilha 
	type Pilha is record
		V  : Vetor_De_Elementos;
		Sp : Integer;
		end record;

	-- Implementa��o do algoritmo 3.1 
	procedure Inicializa(P : in out Pilha);

	-- Implementa��o do algoritmo 3.2
	procedure Push(P : in out Pilha; D : Tipo);

	-- Implementa��o do algoritmo 3.3 
	procedure Pop(P : in out Pilha; R : out Tipo);

	-- Implementa��o do algoritmo 3.4 
	procedure Avalia_Posfix(E : String; R : out Tipo);

	Overflow  : exception;
	Underflow : exception;
end PilhaG;