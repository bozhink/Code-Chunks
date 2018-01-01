-- Arquivo fonte Tabela.Ada
with Ada.Text_IO, Tabela_Para_Inteiros;
use  Ada.Text_IO, Tabela_Para_Inteiros;
procedure Testa_Tabela_Para_Inteiros is
	T1 : Tabela;
begin
	Inicia(T1);

	Insere(T1, 20);

	Insere(T1, 25);

	Put_Line("25 esta armazenado na " &
	         "posicao " & Integer'Image(Pesquisa(T1,25)));
	New_Line;
	Put_Line("O resultado de Pesquisa(T1,15) e': " &
	         Integer'Image(Pesquisa(T1,15)));
end Testa_Tabela_Para_Inteiros;