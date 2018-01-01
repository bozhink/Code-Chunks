-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte GCaminha.Ada

with Ada.Text_IO, Caminhamentos_Em_Grafos;
use  Ada.Text_IO, Caminhamentos_Em_Grafos;
procedure Testa_Caminhamentos_Grafo is
	G1 : Grafo;
begin
	Inicializa(G1);
	Conecta(G1,1,2);
	Conecta(G1,1,5);
	Conecta(G1,1,7);
	Conecta(G1,2,3);
	Conecta(G1,2,6);
	Conecta(G1,2,4);
	Conecta(G1,3,4);
	Conecta(G1,5,4);
	Conecta(G1,5,6);
	Conecta(G1,6,7);
	Conecta(G1,4,7);
	Put_Line("Grafo com sete vertices:");
	Imprime(G1);
	New_Line;
	Put("DFS(G1,1) = ");
	DFS(G1,1);
	New_Line(2);
	Put("BFS(G1,1) = ");
	BFS(G1,1);
	New_Line;

end Testa_Caminhamentos_Grafo;