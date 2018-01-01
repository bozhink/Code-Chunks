-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte SortTopo.Ads

with Grafo_Simples;
generic
	N : Integer;

package Ordenacao_Topologica is

	package GS is new Grafo_Simples(N);
	use GS;

	procedure Sort_Topologico(D : Grafo);



end Ordenacao_Topologica;