-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte ListaDC.Adb
with Ada.Text_IO, Ada.Unchecked_Deallocation;
with Ada.Unchecked_Conversion;
use  Ada.Text_IO;
package body ListaDC is

	-- Instancia o package generico Ada.Text_IO.Integer_IO
	-- para trabalhar com o tipo Long_Integer (32 bits)
	package L_Int is new Ada.Text_IO.Integer_IO(Long_Integer);
	use L_Int;

	-- Cria a procedure Free para liberar memória para tipos "Elo"
	procedure Free is new
			Ada.Unchecked_Deallocation(No,Elo);

	-- Cria uma funcao para converter valores do tipo Elo para
	-- valores do tipo Long_Integer
	function Elo_Int is new Ada.Unchecked_Conversion(Elo,Long_Integer);

	-- Algoritmo 5.19
	procedure Inicializa(Ld : in out Elo) is 
	begin
		Ld      := new No;
		if Ld = null then
			raise Faltou_Memoria;
		end if;
		Ld.Esq  := Ld;
		Ld.Dir  := Ld;
		Ld.Dado := 'D';
	end Inicializa;

	-- Algoritmo 5.20
	procedure Insere_Esq(Ld : in out Elo; 
	                      D : in Tipo_Dado) is
		P : Elo;
	begin
		P          := new No;
		if P = null then
			raise Faltou_Memoria;
		end if;
		P.Dir      := Ld.Dir;
		P.Esq      := Ld;
		Ld.Dir.Esq := P;
		Ld.Dir     := P;
		P.Dado     := D;
	end Insere_Esq;

	-- Algoritmo 5.21
	procedure Insere_Dir(Ld : in out Elo; 
	                      D : in Tipo_Dado) is 
		P : Elo;
		Q : Elo;
	begin
		P          := new No;
		if P = null then
			raise Faltou_Memoria;
		end if;
		P.Dado     := D;
		P.Dir      := Ld;
		P.Esq      := Ld.Esq;
		Ld.Esq.Dir := P;
		Ld.Esq     := P;
	end Insere_Dir;

	-- Algoritmo 5.22
	procedure Insere_Dir_No(Q : in Elo; 
	                        D : in Tipo_Dado) is
		P : Elo;
	begin
		P         := new No;
		if P = null then
			raise Faltou_Memoria;
		end if;
		P.Dado    := D;
		P.Dir     := Q.Dir;
		P.Esq     := Q;
		Q.Dir.Esq := P;
		Q.Dir     := P;
	end Insere_Dir_No;

	-- Algoritmo 5.23
	procedure Retira_Esq(Ld : in out Elo; 
	                      R : out Tipo_Dado) is
		Q : Elo;
	begin
		if Ld = Ld.Dir then
			raise Operacao_Invalida;
		end if;
		Q          := Ld.Dir;
		R          := Q.Dado;
		Ld.Dir.Esq := Ld;
		Ld.Dir     := Ld.Dir.Dir;
		Free(Q);
	end Retira_Esq;

	-- Algoritmo 5.24
	procedure Retira_Dir(Ld : in out Elo; 
	                      R : out Tipo_Dado) is
		P : Elo;
		Q : Elo;
	begin
		if Ld = Ld.Dir then
			raise Operacao_Invalida;
		end if;
		Q         := Ld.Esq;
		R         := Q.Dado;
		Q.Dir.Esq := Q.Esq;
		Q.Esq.Dir := Q.Dir;
		Free(Q);
	end Retira_Dir;

	-- Algoritmo 5.25
	procedure Retira_No(Ld : in out Elo;
	                     Q : in Elo;
	                     R : out Tipo_Dado) is
	begin
		R         := Q.Dado;
		Q.Dir.Esq := Q.Esq;
		Q.Esq.Dir := Q.Dir;
		Free(Q);
	end Retira_No;	

	-- Algoritmo 5.26
	function Consulta(Ld : in Elo;
	                   D : in Tipo_Dado) return Elo is
		P : Elo;
	begin
		P := Ld.Dir;
		while P /= Ld loop
			if P.Dado = D then
				exit;
			else
				P := P.Dir;
			end if;
		end loop;
		return P;
	end Consulta;
		
	-- Algoritmo 5.27
	procedure Libera_Memoria(Ld : in out Elo) is
		P, Q : Elo;
	begin
		P  := Ld.Dir;
		while P /= Ld loop
			Q := P;
			P := P.Dir;
			Free(Q);
		end loop;
		Free(Ld);
		Ld := null;
	end Libera_Memoria;

	procedure Exibe_Lista(Ld : in out Elo; 
	                      Msg : in String) is
		P : Elo;
	begin
		P := Ld.Dir;
		Put(Msg & ": ");
		while P /= Ld loop
--			Put(Elo_Int(P), 10);
--			Put(Elo_Int(P.Esq), 10);
--			Put(' ');
			Put(P.Dado);
			P := P.Dir;
--			Put(Elo_Int(P));
--			New_Line;
		end loop;
		New_Line;
	end Exibe_Lista;
			
end ListaDC;