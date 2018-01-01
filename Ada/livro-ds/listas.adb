-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte ListaS.Adb
with Ada.Text_IO, Ada.Unchecked_Deallocation;
use  Ada.Text_IO;
package body ListaS is

	package L_Int is new Ada.Text_IO.Integer_IO(Long_Integer);
	use L_Int;

	procedure Free is new
			Ada.Unchecked_Deallocation(No,Elo);

	procedure Inicializa(Ls : in out Elo) is
	begin
		Ls := null;
	end Inicializa;

	procedure Insere_Esq(Ls : in out Elo;
 	                     D  : in Tipo_Dado) is
		P : Elo;
	begin
		P      := new No;
		if P = null then
			raise Faltou_Memoria;
		end if;
		P.Dado := D;
		P.Link := Ls;
		Ls      := P;
	end Insere_Esq;

	procedure Insere_Dir(Ls : in out Elo;
                             D  : in Tipo_Dado) is 
		P : Elo;
		Q : Elo;
	begin
		P := new No;
		if P = null then
			raise Faltou_Memoria;
		end if;
		P.Dado := D;
		P.Link := null;
		if Ls = null then
			Ls := P;
		else
			Q := Ls;
			while Q /= null loop
				if Q.Link = null then
					Q.Link := P;
					exit;
				else
					Q := Q.Link;
				end if;
			end loop;
		end if;
	end Insere_Dir;

	procedure Insere_Dir_No(Q : in Elo;
                                D : in Tipo_Dado) is
		P : Elo;
	begin
		P := new No;
		if P = null then
			raise Faltou_Memoria;
		end if;
		P.Dado := D;
		P.Link := Q.Link;
		Q.Link := P;
	end Insere_Dir_No;

	procedure Retira_Esq(Ls : in out Elo;
                             R  : out Tipo_Dado) is
		Q : Elo;
	begin
		if Ls = null then
			raise Operacao_Invalida;
		end if;
		Q := Ls;
		R := Q.Dado;
		Ls := Q.Link;
		Free(Q);
	end Retira_Esq;

	procedure Retira_Dir(Ls : in out Elo;
                             R  : out Tipo_Dado) is
		P : Elo;
		Q : Elo;
	begin
		if Ls = null then
			raise Operacao_Invalida;
		end if;
		Q := Ls;
		if Q.Link = null then
			Ls := null;
		else	
			while Q.Link /= null loop
				P := Q;
				Q := Q.Link;
			end loop;
			Q := P.Link;
			P.Link := null;
		end if;
		R := Q.Dado;
		Free(Q);
	end Retira_Dir;

	procedure Retira_No(Ls : in out Elo;
	                    Q  : in Elo;
                            R  : out Tipo_Dado) is
		P : Elo;
	begin
		if Ls = Q then
			Ls := Q.Link;
		else
			-- Faz o no' antecessor de Q apontar para
			-- o sucessor de Q
			P := Ls;
			while P /= null loop
				if P.Link = Q then
					P.Link := Q.Link;
					P      := null;
				else
					P      := P.Link;
				end if;
			end loop;
		end if;
		R := Q.Dado;
		Free(Q);
	end Retira_No;	

	function  Consulta(Ls : in Elo;
	                   D  : in Tipo_Dado) return Elo is	
		P : Elo;
	begin
		P := Ls;
		while P /= null loop
			if P.Dado = D then
				exit;
			else
				P := P.Link;
			end if;
		end loop;
		return P;
	end Consulta;

	procedure Libera_Memoria(Ls : in out Elo) is
		P, Q : Elo;
	begin
		P  := Ls;
		while P /= null loop
			Q := P;
			P := P.Link;
			Free(Q);
		end loop;
		Ls := null;
	end Libera_Memoria;
		
	procedure Exibe_Lista(Ls  : in out Elo; 
	                      Msg : in String) is
		P : Elo;
	begin
		P := Ls;
		Put(Msg & ": ");
		while P /= null loop
			Put(P.Dado);
			P := P.Link;
		end loop;
		New_Line;
	end Exibe_Lista;
			
end ListaS;