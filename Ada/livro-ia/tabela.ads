-- Arquivo fonte Tabela.Ads
package Tabela_Para_Inteiros is

	subtype Tipo is Integer;
	subtype Intervalo is Integer range 1 .. 10;
	type Vet_Tab is array (Intervalo) of Tipo;
	type Tabela is private;

	-- Aqui estão as especificações para as 
	-- operações com a tabela

	-- Ative este sub-programa antes de iniciar
	-- o uso da tabela
	procedure Inicia(Tab : out Tabela);

	-- Este sub-programa armazena um novo valor, Quem,
	-- na tabela Tab
	procedure Insere(Tab : in out Tabela; Quem : Tipo);

	-- Dado um certo valor esta função retorna o
	-- índice onde Quem está em Tab caso contrário
	-- retorna o primeiro valor a esquerda do primeiro
	-- índice da tabela
	function Pesquisa(Tab : Tabela; Quem : Tipo)
			return Integer;

	-- Retira o elemento da tabela indicado por Onde
	procedure Retira(Tab : in out Tabela; 
	                 Onde : Intervalo);
private
	type Tabela is record
		T  : Vet_Tab;
		N : Integer;
	end record;
end Tabela_Para_Inteiros;
