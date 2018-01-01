-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte TDAPilha.Ads
package Pilha_Char is  -- Interface para clientes da pilha

	-- Facilita a troca to tipo da pilha
	subtype Tipo_Da_Pilha is Character;
	
	-- Declara os subscritos da Pilha
	subtype Intervalo_Pilha is Integer range 1 .. 10;

	-- Declaração de um tipo array
	type Vetor_De_Elementos is array(Intervalo_Pilha) of Tipo_Da_Pilha;

	-- Declara o tipo Pilha 
	type Pilha is record
		V  : Vetor_De_Elementos;
		Sp : Integer;
		end record;

	-- Implementação do algorítmo 3.1 
	procedure Inicializa(P : in out Pilha);

	-- Implementação do algorítmo 3.2
	procedure Push(P : in out Pilha; D : Tipo_Da_Pilha);

	-- Implementação do algorítmo 3.3 
	procedure Pop(P : in out Pilha; R : out Tipo_Da_Pilha);

end Pilha_Char;