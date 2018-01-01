-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte PesqSeq.Ads
generic
	Max : Integer;
	type Key is limited private;
package Pesquisa_Sequencial is

	type Estrutura is private;

	Overflow_Estrutura : exception;
	Remocao_Invalida   : exception;

	procedure Inicializa(T : in out Estrutura);

	procedure Insere(T : in out Estrutura; K : Key);

	function Consulta(T : Estrutura; K : Key) return Natural;

	procedure Remove(T : in out Estrutura; P : Positive);

	procedure Imprime(Msg : String; T : Estrutura);

private
	type VE is array(1..Max) of Key;

	type Estrutura is record
		V : VE;
		N : Natural;
		end record;

end Pesquisa_Sequencial;