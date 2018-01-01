-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte ListaD.Adb
with Ada.Text_IO, Ada.Unchecked_Deallocation;
with Ada.Unchecked_Conversion;	-- Utilizado para converter 
				-- endereços para inteiros
use  Ada.Text_IO;
package body ListaD is

	-- Instancia o package genérico para trabalhar com o tipo
	-- Long_Integer
	package L_Int is new Ada.Text_IO.Integer_IO(Long_Integer);
	use L_Int;

	-- Cria uma procedure Free para liberar memória para tipos "Elo"
	procedure Free is new
			Ada.Unchecked_Deallocation(No,Elo);

	-- Cria uma função para converter valores do tipo Elo para 
	-- valores do tipo Long_Integer
	function Elo_Int is new Ada.Unchecked_Conversion(Elo,Long_Integer);

	-- Algoritmo 5.10
	procedure Inicializa(Ld : in out Elo) is 
	begin
		Ld := null;
	end Inicializa;

	-- Algoritmo 5.11
	procedure Insere_Esq(Ld : in out Elo; 
	                     D  : in Tipo_Dado) is
		P : Elo;
	begin
		P      := new No;
		if P = null then
			raise Faltou_Memoria;
		end if;
		if Ld /= null then
			Ld.Esq := P;
		end if;
		P.Dado := D;
		P.Esq  := null;
		P.Dir  := Ld;
		Ld     := P;
	end Insere_Esq;

	-- Algoritmo 5.12
	procedure Insere_Dir(Ld : in out Elo; 
	                     D  : in Tipo_Dado) is 
		P : Elo;
		Q : Elo;
	begin
		P      := new No;
		if P = null then
			raise Faltou_Memoria;
		end if;
		P.Dado := D;
		P.Dir  := null;
		if Ld = null then
			Ld    := P;
			P.Esq := null;
		else
			Q := Ld;
			while Q /= null loop
				if Q.Dir = null then
					Q.Dir := P;
					P.Esq := Q;
					Q     := null;
				else
					Q := Q.Dir;
				end if;
			end loop;
		end if;
	end Insere_Dir;

	-- Algoritmo 5.13
	procedure Insere_Dir_No(Q : in Elo; 
	                        D : in Tipo_Dado) is
		P : Elo;
	begin
		P      := new No;
		if P = null then
			raise Faltou_Memoria;
		end if;
		P.Dado := D;
		P.Dir  := Q.Dir;
		if Q.Dir /= null then
			Q.Dir.Esq := P;
		end if;
		P.Esq  := Q;
		Q.Dir  := P;
	end Insere_Dir_No;

	-- Algoritmo 5.14
	procedure Retira_Esq(Ld : in out Elo; 
	                     R  : out Tipo_Dado) is
		Q : Elo;
	begin
		if Ld = null then
			raise Operacao_Invalida;
		end if;
		Q  := Ld;
		R  := Q.Dado;
		Ld := Q.Dir;
		if Ld /= null then
			Ld.Esq := null;
		end if;
		Free(Q);
	end Retira_Esq;

	-- Algoritmo 5.15
	procedure Retira_Dir(Ld : in out Elo; 
	                     R  : out Tipo_Dado) is
		P : Elo;
		Q : Elo;
	begin
		if Ld = null then
			raise Operacao_Invalida;
		end if;
		Q := Ld;
		if Q.Dir = null then
			Ld := null;
		else	
			while Q.Dir /= null loop
				P := Q;
				Q := Q.Dir;
			end loop;
			Q     := P.Dir;
			P.Dir := null;
		end if;
		R := Q.Dado;
		Free(Q);
	end Retira_Dir;

	-- Algoritmo 5.16
	procedure Retira_No(Ld : in out Elo;
	                    Q  : in Elo;
	                    R  : out Tipo_Dado) is
	begin
		if Ld = Q then
			Ld := Q.Dir;
			if Ld /= null then
				Ld.Esq := null;
			end if;
		else
			Q.Esq.Dir := Q.Dir;
			if Q.Dir /= null then
				Q.Dir.Esq := Q.Esq;
			end if;
		end if;
		R := Q.Dado;
		Free(Q);
	end Retira_No;	

	-- Algoritmo 5.17
	function Consulta(Ld : in Elo;
	                   D : in Tipo_Dado) return Elo is
		P : Elo;
	begin
		P := Ld;
		while P /= null loop
			if P.Dado = D then
				exit;
			else
				P := P.Dir;
			end if;
		end loop;
		return P;
	end Consulta;
		
	-- Algoritmo 5.18
	procedure Libera_Memoria(Ld : in out Elo) is
		P, Q : Elo;
	begin
		P  := Ld;
		while P /= null loop
			Q := P;
			P := P.Dir;
			Free(Q);
		end loop;
		Ld := null;
	end Libera_Memoria;

	procedure Exibe_Lista(Ld : in out Elo; 
	                      Msg : in String) is
		P : Elo;
	begin
		P := Ld;
		Put(Msg & ": ");
		while P /= null loop
-- Retire os comentários para exibir o endereço de p e dos
-- campos de link Esq e Dir
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
			
end ListaD;