-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte Trie.Ads
package Trie is

	Max  : constant := 27;

	Operacao_Invalida : exception;

	type No;
	type Elo is access No;

	type Array_C is array(1..Max) of Elo;
	type No is record 
		C   : Array_C;
		Tag : Integer;
		end record;

	procedure Inicializa(R : in out Elo);
	procedure Insere(R : Elo; K : String; Tag : Integer);
	function Consulta(R : Elo; K : String) return Integer;
	function Remove(R : Elo; K : String) return Boolean;
	procedure Imprime(P : Elo; K : String);

end Trie;
