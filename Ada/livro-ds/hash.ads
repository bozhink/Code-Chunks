-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte Hash.Ads
generic
	Tamanho_Key    : Integer;
	Tamanho_Tabela : Integer;
	Valor_Hash     : Integer;
package Hash_Aberto is

	Tabela_Overflow : exception;
	Indice_Invalido : exception;

	subtype Key is String(1..Tamanho_Key);

	type Tabela is private;
	type Rec_Tabela is record
		Id   : Key;
		Tag  : Integer;
		Next : Integer;
		end record;

	procedure Inicializa(T : in out Tabela);
	procedure Insere(T   : in out Tabela; K : in String; 
	                 Tag : in Integer);
	procedure Remove(T : in out Tabela; K : in String; 
	                 R : out Boolean);
	function Consulta(T : in Tabela; K : in String) return Integer;
	function Quantidade(T : in Tabela) return Integer;
	procedure Imprime(T : in Tabela);
private
	type Array_Bucket is array(0 .. (Valor_Hash - 1)) of Integer;
	type Array_Tab is array(1 .. Tamanho_Tabela) of Rec_Tabela;
	type Tabela is record
		N      : Integer;
		Livre  : Integer;		
		Bucket : Array_Bucket;
		Tab    : Array_Tab;
		end record;
end Hash_Aberto;