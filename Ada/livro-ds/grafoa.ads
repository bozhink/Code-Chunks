-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte GrafoA.Ads
generic
	N : Integer;

package Grafo_Lista_Adjacencia is

	Operacao_Invalida : exception;
	Faltou_Memoria    : exception;

	subtype Tipo_Dado is Integer;
	type No is private;
	type Elo is access No;

	type Grafo is array(1 .. N) of Elo;

	procedure Inicializa(G : in out Grafo);
	procedure Conecta(G : in out Grafo; I, J : Tipo_Dado);
	procedure Desconecta(G : in out Grafo; I, J : Tipo_Dado);
	function Adjacente(G : in Grafo; I, J : Tipo_Dado) return Boolean;
	procedure Libera_Memoria(G : in out Grafo);
	procedure Imprime(G : in Grafo);
private
	type No is record
		Dado : Tipo_Dado;
		Link : Elo;
		end record;
end Grafo_Lista_Adjacencia;