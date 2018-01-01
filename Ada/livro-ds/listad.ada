-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte ListaD.Ada
with Ada.Text_IO, ListaD; 
use Ada.Text_IO, ListaD;
procedure Lista_Dupla is
	Head     : Elo;
	Retirado : Tipo_Dado;
begin
	Inicializa(Head);
	Insere_Esq(Head,'A');
	Insere_Esq(Head,'B');
	Insere_Esq(Head,'C');
	Exibe_Lista(Head,"Lista apos Insere_Esq A, B, C");
	Insere_Dir(Head,'D');
	Insere_Dir(Head,'E');
	Insere_Dir(Head,'F');
	Exibe_Lista(Head,"Lista apos Insere_Dir D, E, F");
	-- Insere 'X' a direita do nó cujo campo de dado é 'A' 
	Insere_Dir_No(Consulta(Head,'A'),'X');
	Exibe_Lista(Head,"Lista apos Insere_Dir_Q(Consulta(Head,'A'),'X')");
	Retira_Esq(Head,Retirado);
	Put_Line(Retirado & " estava no primeiro nodo da lista");
	Retira_Dir(Head,Retirado);
	Put_Line(Retirado & " estava no primeiro nodo da lista");
	Exibe_Lista(Head,"Lista apos retirada do primeiro e ultimo nodos");
	Retira_No(Head,Consulta(Head,'X'),Retirado);
	Put_Line("O elemento retirado foi " &  Retirado);
	Exibe_Lista(Head,"Lista depois de retirar o nodo que continha 'X'");
	Libera_Memoria(Head);
end Lista_Dupla;
