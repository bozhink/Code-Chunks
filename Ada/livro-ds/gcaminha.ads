-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte GCaminha.Ads

with Grafo_Simples;
package Caminhamentos_Em_Grafos is

	package Grafo_Com_7 is new Grafo_Simples(7);
	use Grafo_Com_7;

	V : array(Grafo'First .. Grafo'Last) of Boolean := (others => False);

	procedure DFS(G : Grafo; I : Integer);
	procedure BFS(G : Grafo; I : Integer);

end Caminhamentos_Em_Grafos;