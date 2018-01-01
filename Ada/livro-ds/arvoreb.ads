-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte ArvoreB.Ads

package Arvore_B is

	T    : constant := 2;  -- Base para o número de chaves de um nó
	WLen : constant := 14; -- Número máximo de caracteres de uma chave

	Keys : constant := 2 * T - 1;
	Sons : constant := 2 * T;

	subtype Key is String(1..WLen);

	type No;
	type Elo is access No;

	type Array_C      is array(1..Sons) of Elo;
	type Array_Chave  is array(1..Keys) of Key;
	type Array_Tag    is array(1..Keys) of Integer;
	type Array_Status is array(1..Keys) of Boolean;

	type No is record
		N      : Integer;
		Folha  : Boolean;
		C      : Array_C;
		Chave  : Array_Chave;
		Tag    : Array_Tag;
		Status : Array_Status;
		end record;

	Chave_Ja_Existe : exception;

	procedure Inicializa(R : in out Elo);
	procedure Divide_Filho(X : Elo; I : Integer; FI : Elo);
	procedure Insere_Nao_Cheio(X   : Elo; 
	                           K   : String; 
	                           Tag : Integer);
	procedure Insere(Ra  : in out Elo; 
	                 K   : String; 
	                 Tag : Integer);
	function Consulta(R : Elo; K : String) return Integer;
	function Remove(R : Elo; K : String) return Boolean;
	procedure Squash(Ra : in out Elo);
	procedure Conta(R                 : Elo; 
	                Deletados, Ativos : in out Integer);
	procedure Imprime(Ra : Elo);
	
end Arvore_B;