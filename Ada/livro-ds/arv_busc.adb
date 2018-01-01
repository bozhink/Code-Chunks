-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte Arv_Busc.Adb
with Ada.Text_IO, Ada.Unchecked_Deallocation;
use  Ada.Text_IO;
package body Arvore_De_Busca is

	-- Cria a procedure Free para liberar memória para tipos "Elo"
	procedure Free is new
			Ada.Unchecked_Deallocation(No,Elo);

	procedure Pre_Fixado(R : Elo) is -- Algoritmo 7.1
	begin
		if R /= null then
			Put(R.Chave);
			Pre_Fixado(R.Esq);
			Pre_Fixado(R.Dir);
		end if;
	end Pre_Fixado;

	procedure Central(R : Elo) is -- Algoritmo 7.2
	begin
		if R /= null then
			Central(R.Esq);
			Put(R.Chave);
			Central(R.Dir);
		end if;
	end Central;

	procedure Pos_Fixado(R : Elo) is -- Algoritmo 7.3
	begin 
		if R /= null then
			Pos_Fixado(R.Esq);
			Pos_Fixado(R.Dir);
			Put(R.Chave);
		end if;
	end Pos_Fixado;

	procedure Inicializa(R : in out Elo) is -- Algoritmo 10.9
	begin
		R := null;
	end Inicializa;

	procedure Insere(R : in out Elo; K : Key) is -- Algoritmo 10.10
		P, Q  : Elo;
		Itere : Boolean;
	begin
		p := new No;
		if P = null then
			Put("*** Insere: Memoria insuficiente");
			Put_Line(" para insercao de " & K);
			raise Storage_Error;
		end if;

		P.Chave := K;
		P.Esq   := null;
		P.Dir   := null;
		P.Pai   := null;

		if R = null then
			R := P;
		else 
			Itere := True;
			Q     := R;
			while Itere loop
				if Q.Chave > K then
					if Q.Esq = null then
						Q.Esq := P;
						P.Pai := Q;
						Itere := False;
					else
						Q := Q.Esq;
					end if;
				else -- Chave de Q é <= K 
					if Q.Dir = null then 
						Q.Dir := P;
						P.Pai := Q;
						Itere  := False;
					else
						Q := Q.Dir;
					end if;
				end if;
			end loop;
		end if;

	end Insere;

	-- Algoritmo 10.11
	function Consulta(R : Elo; K : Key) return Elo is 
		Q : Elo;
	begin
		Q := R;
		while Q /= null loop
			if Q.Chave = K then
				return Q;
			elsif Q.Chave > K then
				Q := Q.Esq;
			else
				Q := Q.Dir;
			end if;
		end loop;
		return null;
	end Consulta;

	-- Algoritmo 10.12
	procedure Minimo(R : Elo; M : in out Elo) is 
	begin
		M := R;
		while M.Esq /= null loop
			M := M.Esq;
		end loop;
	end Minimo;

	-- Algoritmo 10.13
	procedure Sucessor(Quem : Elo; S : in out Elo) is 
	begin
		if Quem.Dir /= null then
			Minimo(Quem.Dir,S);
		else 
			S := Quem.Pai;
			while S /= null loop
				if Quem = S.Dir then
					Quem := S;
					S := S.Pai;
				end if;
			end loop;
		end if;
	end Sucessor;

	-- Tendo em vista o endereço de um nó, Quem, o campo de ligação de seu
	-- ancestral é atualizado com um novo endereço contido em V 
	procedure Atualiza_Sub_Arvore_Pai(R : in out Elo; 
                                               Quem : Elo; V : Elo) is
	begin
		if Quem.Pai = null or Quem = R then
			R := V;
		elsif Quem.Pai.Esq = Quem then
			Quem.Pai.Esq := V;
		else
			Quem.Pai.Dir := V;
		end if;

		if R /= null then
			R.Pai := null;
		end if;
	end Atualiza_Sub_Arvore_Pai;

	-- Algoritmo 10.14
	procedure Remove(R : in out Elo; Quem : Elo) is 
		T : Elo;
	begin
		if Quem.Esq = null and Quem.Dir = null then
			-- Quem é uma folha
			Atualiza_Sub_Arvore_Pai(R,Quem,null);
		elsif Quem.Esq = null then
			Atualiza_Sub_Arvore_Pai(R,Quem,Quem.Dir);
		elsif Quem.Dir = null then
			Atualiza_Sub_Arvore_Pai(R,Quem,Quem.Esq);
		else
			Sucessor(Quem,T);
			Atualiza_Sub_Arvore_Pai(R,T,null);
			if T.Esq = null and T.Dir = null then 
				Atualiza_Sub_Arvore_Pai(R,Quem,T);
				T.Pai   := Quem.Pai;				T.Esq   := Quem.Esq;
				T.Dir   := Quem.Dir;
				if T.Dir = T then
					T.Dir := null;
				end if;
				if T.Esq = T then
					T.Esq := null;
				end if;
			else 
				Quem.Dir   := T.Dir;
				Quem.Chave := T.Chave;
				Quem        := T;
			end if;
		end if;
		Free(Quem);
	end Remove;
end Arvore_De_Busca;