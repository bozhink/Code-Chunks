-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte ListaS.Ads
package ListaS is

	Operacao_Invalida : exception;
	Faltou_Memoria    : exception;

	subtype Tipo_Dado is Character;
	type No is private;
	type Elo is access No;

	procedure Inicializa(Ls : in out Elo);
	procedure Insere_Esq(Ls : in out Elo;
                             D : in Tipo_Dado);	
	procedure Insere_Dir(Ls : in out Elo;
                             D  : in Tipo_Dado);	
	procedure Insere_Dir_No(Q : in Elo;
                                D : in Tipo_Dado);	
	procedure Retira_Esq(Ls : in out Elo;
                             R  : out Tipo_Dado);	
	procedure Retira_Dir(Ls : in out Elo;
                             R  : out Tipo_Dado);	
	procedure Retira_No(Ls : in out Elo;
	                    Q  : in Elo;
                            R  : out Tipo_Dado);	
	function  Consulta(Ls : in Elo;
                           D  : in Tipo_Dado) return Elo;	
	procedure Libera_Memoria(Ls : in out Elo);
	procedure Exibe_Lista(Ls : in out Elo; Msg : in String);
private
	type No is record
		Dado : Tipo_Dado;
		Link : Elo;
		end record;
end ListaS;