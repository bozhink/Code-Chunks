-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte GrafoS.Ads
generic
	N : Integer;

package Grafo_Simples is

	type Grafo is array(1 .. N, 1 .. N) of Boolean;

	procedure Inicializa(G : in out Grafo);
	procedure Conecta(G : in out Grafo; I, J : Integer);
	procedure Desconecta(G : in out Grafo; I, J : Integer);
	function Adjacente(G : in Grafo; I, J : Integer) return Boolean;
	procedure Imprime(G : in Grafo);

end Grafo_Simples;