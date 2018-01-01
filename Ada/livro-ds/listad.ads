-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte ListaD.Ads
package ListaD is

	Operacao_Invalida : exception;
	Faltou_Memoria    : exception;

	subtype Tipo_Dado is Character;
	type No is private;
	type Elo is access No;

	procedure Inicializa(Ld : in out Elo);
	procedure Insere_Esq(Ld : in out Elo;
	                      D : in Tipo_Dado);	
	procedure Insere_Dir(Ld : in out Elo;
	                      D : in Tipo_Dado);	
	procedure Insere_Dir_No(Q : in Elo;
	                        D : in Tipo_Dado);	
	procedure Retira_Esq(Ld : in out Elo;
	                      R : out Tipo_Dado);	
	procedure Retira_Dir(Ld : in out Elo;
	                      R : out Tipo_Dado);	
	procedure Retira_No(Ld : in out Elo;
	                     Q : in Elo;
	                     R : out Tipo_Dado);	
	function Consulta(Ld : in Elo;
	                   D : in Tipo_Dado) return Elo;	
	procedure Libera_Memoria(Ld : in out Elo);
	procedure Exibe_Lista(Ld : in out Elo; Msg : in String);
private
	type No is record
		Esq  : Elo;
		Dado : Tipo_Dado;
		Dir  : Elo;
		end record;
end ListaD;