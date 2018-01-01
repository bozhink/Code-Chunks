-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte Floresta.Ads

with Ada.Direct_IO;

generic
	N : Integer;

package Floresta_Str is

	subtype Key is String(1..N);

	type TKSize is private;
	type Floresta is private;

	Operacao_Invalida : exception;

	procedure Inicializa(Fn : in String; 
	                     H  : in out Floresta);
	
	procedure Abre(Fn : in String;
	               H  : in out Floresta);
	procedure Fecha(H : in out Floresta);
	procedure Squash(Fn : in String);
	function Consulta(H : in Floresta; 
	                  K : in String) return Integer;
	procedure Remove(H : in out Floresta; 
	                 K : in String);
	procedure Insere(H   : in out Floresta; 
	                 K   : in String;
	                 Tag : in Integer);
	procedure Imprime(H : in Floresta);
	function Tempo_De_Compactar(H : in Floresta) return Boolean;

private

	Floresta_Hash : constant := 256;

	WFn           : constant := 256;

	subtype Nome_Arq is String(1..WFn);

	type TKSize is record
		LLink  : Integer;
		RLink  : Integer;
		Tag    : Integer;
		Status : Character;  --  'I' em uso; 'D' = deletado
		Len    : Positive;
		Chave  : Key;
		end record;

	type Array_Raiz is array(1..Floresta_Hash) of Integer;

	package Nodo_IO is new Ada.Direct_IO(TKSize);
	package Floresta_IO is new Ada.Direct_IO(Floresta);

	type Floresta is record
		TFp       : Nodo_IO.File_Type;
		THp       : Floresta_IO.File_Type;
		Raiz      : Array_Raiz;
		Em_Uso    : Integer;
		Deletados : Integer;
		THn       : Nome_Arq;
		THn_Len   : Natural;
		TFn       : Nome_Arq;
		TFn_Len   : Natural;
		Compacte  : Boolean;
		end record;

end Floresta_Str;