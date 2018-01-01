-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte Arv_Busc.Ads
package Arvore_De_Busca is
	subtype Key is Character;

	type No is private;
	type Elo is access No;

	procedure Pre_Fixado(R : Elo); 
	procedure Central(R : Elo); 
	procedure Pos_Fixado(R : Elo);
	procedure Inicializa(R : in out Elo); 
	procedure Insere(R : in out Elo; K : Key); 
	function Consulta(R : Elo; K : Key) return Elo;
	procedure Minimo(R : Elo; M : in out Elo);
	procedure Sucessor(Quem : Elo; S : in out Elo);
	procedure Remove(R : in out Elo; Quem : Elo);
private
	type No is record
		Esq   : Elo;
		Chave : Key;
		Dir   : Elo;
		Pai   : Elo;
		end record;
end Arvore_De_Busca;