-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte GrafoS.Ada
with Ada.Text_IO, Ada.Integer_Text_IO, Grafo_Simples;
use  Ada.Text_IO, Ada.Integer_Text_IO;
procedure Testa_Grafo is
	package GS is new Grafo_Simples(4);
	use GS;
	G1 : Grafo;
begin
	Inicializa(G1);
	Conecta(G1,1,2);
	Conecta(G1,1,3);
	Conecta(G1,4,4);
	Put_Line("Grafo com arcos {1,2}, {1,3}, {4,4}");
	Imprime(G1);
	Conecta(G1,3,2);
	Desconecta(G1,1,3);
	New_Line(2);
	Put_Line("Grafo com arcos {1,2}, {3,2}, {4,4}");
	Imprime(G1);
end Testa_Grafo;
