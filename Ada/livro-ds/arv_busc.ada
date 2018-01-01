-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte Arv_Busc.Ada
with Ada.Text_IO, Arvore_De_Busca;
use  Ada.Text_IO, Arvore_De_Busca;
procedure Testa_Arvore_De_Busca is

	Raiz : Elo;
begin

	Inicializa(Raiz);

	Insere(Raiz, 'G');
	Insere(Raiz, 'O');
	Insere(Raiz, 'N');
	Insere(Raiz, 'P');
	Insere(Raiz, 'Z');
	Insere(Raiz, 'D');
	Insere(Raiz, 'B');
	Insere(Raiz, 'A');
	Insere(Raiz, 'C');
	Insere(Raiz, 'F');

	Put("Caminhamento Pre_Fixado: ");
	Pre_Fixado(Raiz);
	New_Line;

	Put("Caminhamento Central: ");
	Central(Raiz);
	New_Line;

	Put("Caminhamento Pos_Fixado: ");
	Pos_Fixado(Raiz);
	New_Line;

	Remove(Raiz,Consulta(Raiz,'G'));

	Put("Caminhamento Central depois da remocao de G: ");
	Central(Raiz);
	New_Line;

end Testa_Arvore_De_Busca;