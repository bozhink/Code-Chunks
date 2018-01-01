-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte SortTopo.Ada

with Ada.Text_IO, Ada.Integer_Text_IO, Ordenacao_Topologica;
use  Ada.Text_IO, Ada.Integer_Text_IO;

procedure Testa_Ordenacao_Topologica is

	package O_Topologica is new Ordenacao_Topologica(9);
	use O_Topologica;

	D1 : Grafo;
begin
	Inicializa(D1);

	Conecta(D1,1,2);
	Conecta(D1,2,4);
	Conecta(D1,2,5);
	Conecta(D1,4,7);
	Conecta(D1,5,7);
	Conecta(D1,3,6);
	Conecta(D1,6,8);
	Conecta(D1,6,9);
	Conecta(D1,7,9);

	Put_Line("Dag D1:");
	Imprime(D1);
	New_Line;

	Put("A ordenacao topologica inversa de D1 e': ");
	Sort_Topologico(D1);
	New_Line;
end Testa_Ordenacao_Topologica;
