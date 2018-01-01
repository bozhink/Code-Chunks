-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte GrafoVS.Ada
with Ada.Text_IO, Grafo_Valorado;
use  Ada.Text_IO;
procedure Testa_Grafo_Valorado is  
	package GV is new Grafo_Valorado(7,Integer,99);
	use GV; 
	G1, C1, P1, Cd1 : Grafo;
	X               : Integer;
begin
	Inicializa(G1);

	Conecta(G1,1,2,1);
	Conecta(G1,1,5,1);
	Conecta(G1,1,7,9);
	Conecta(G1,2,3,1);
	Conecta(G1,2,4,4);
	Conecta(G1,2,6,5);
	Conecta(G1,3,4,2);
	Conecta(G1,4,7,3);
	Conecta(G1,5,4,10);
	Conecta(G1,5,6,2);
	Conecta(G1,6,3,8);
	Conecta(G1,6,7,3);
	Conecta(G1,7,2,6);

	Put_Line("Grafo com sete vertices:");
	Imprime(G1);
	New_Line;

	Put_Line("Menores custos:");
	Menores_Custos(G1,C1);
	Imprime(C1);
	New_Line;

	Put_Line("Matriz de caminhos:");
	Gera_Caminhos(G1,P1);
	Imprime(P1);
	New_Line;

	Menor_Caminho(G1,1,7);
	Menor_Caminho(G1,1,4);
	Menor_Caminho(G1,4,6);

	New_Line;
	Gera_Conectividade(G1,Cd1);
	Imprime(Cd1);

	New_Line(2);
	Put_Line("Exentricidades de G1: ");
	X := Centro(G1);
	Put("O centro de G1 e': ");
	Put(X, 1);
	New_Line;

end Testa_Grafo_Valorado;
