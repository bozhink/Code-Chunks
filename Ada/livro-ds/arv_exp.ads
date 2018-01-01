-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte Arv_Exp.Ads
package Arv_Exp is

	subtype Key is Character;

	type No;

	type Elo is access No;

	type No is record
		Esq    : Elo;
		Op_Val : Key;
		Dir    : Elo;
		Pai    : Elo;
		P      : Integer;
		end record;

	-- Algoritmo 7.3 Modificado
	function Calcula(R : Elo) return Integer;

	procedure Gera_Expressao(Exp : String; Raiz : in out Elo);
end Arv_Exp;