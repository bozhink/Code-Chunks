-- Arquivo fonte TabelaH.Ada
package TabelaH is

	type Elemento is record
		Nome : String(1..10);
		Tag  : Integer;
		end record;

	type Tabela is private;

	package Atualiza is
		Tabela_Cheia : exception;

		procedure Inicia(T : out Tabela);
		procedure Insere(T : in out Tabela;
		                 V : Elemento);
		procedure Retira(T   : in out Tabela;
		                 Pos : Positive;
		                 R   : out Boolean);
		function Valor(T : Tabela; Pos : Positive) 
				return Elemento;
		function Quantos (T : Tabela) return Natural;
	end Atualiza;

	package Ordena is
		-- Estes métodos de ordenação são aceitáveis
		-- para tabelas pequenas (~ menos de 200 elementos)
		procedure Ascendente(T : in out Tabela);
		procedure Descendente(T : in out Tabela);
	end Ordena;

	package Pesquisa is
		-- As funções de pesquisa retornam 
		-- a posição de chave dentro da tabela 
		-- ou zero quando a chave não é encontrada
		function Sequencial(T : Tabela; Chave : String) 
				return Natural;
		-- A tabela deve estar em ordem ascendente
		-- A pesquisa binária é muito mais eficiente
		-- que a pesquisa seqüencial
		function Binaria(T : Tabela; Chave : String) 
				return Natural;
	end Pesquisa;
private
	type Array_Tabela is array(1..10) of Elemento;

	type Tabela is record
		Tab : Array_Tabela;
		N   : Integer;
		end record;
end TabelaH;

package body TabelaH.Atualiza is
	
	procedure Inicia(T : out Tabela) is
	begin
		T.N := 0;
	end Inicia;

	procedure Insere(T : in out Tabela;
	                 V : Elemento) is
	begin
		if T.N >= T.Tab'Length then
			raise Tabela_Cheia;
		end if;
		T.N := T.N + 1;
		T.Tab(T.N) := V;
	end Insere;

	procedure Retira(T   : in out Tabela;
	                 Pos : Positive;
	                 R   : out Boolean) is
	begin
		if Pos < 1 or Pos > T.N then
			R := False;
		else
			for I in Pos + 1 .. T.N loop
				T.Tab(I - 1) := T.Tab(I);
			end loop;
			T.N := T.N - 1;
			R := True;
		end if;
	end Retira;			

	function Valor(T : Tabela; Pos : Positive) return Elemento is
	begin
		return T.Tab(Pos);
	end Valor;

	function Quantos (T : Tabela) return Natural is
	begin
		return T.N;
	end Quantos;
	
end TabelaH.Atualiza;

package body TabelaH.Ordena is
	procedure Swap(X, Y : in out Elemento) is
		Temp : Elemento;
	begin
		Temp := X;
		X := Y;
		Y := Temp;
	end Swap;

	procedure Ascendente(T : in out Tabela) is
	begin
		for Esq in 1 .. T.N - 1 loop
			for Dir in Esq + 1 .. T.N loop
				if T.Tab(Esq).Nome > 
				   T.Tab(Dir).Nome then
					Swap(T.Tab(Esq),T.Tab(Dir));
				end if;
			end loop;
		end loop;
	end Ascendente;		

	procedure Descendente(T : in out Tabela) is	
	begin
		for Esq in 1 .. T.N - 1 loop
			for Dir in Esq + 1 .. T.N loop
				if T.Tab(Esq).Nome < 
				   T.Tab(Dir).Nome then
					Swap(T.Tab(Esq),T.Tab(Dir));
				end if;
			end loop;
		end loop;
	end Descendente;
end TabelaH.Ordena;

package body TabelaH.Pesquisa is
	function Sequencial(T : Tabela; Chave : String) 
			return Natural is
	begin
		for I in 1 .. T.N loop
			if T.Tab(I).Nome = Chave then
				return I;
			end if;
		end loop;
		return 0;
	end Sequencial;

	function Binaria(T : Tabela; Chave : String) 
			return Natural is
		Primeiro : Positive := 1;
		Ultimo   : Natural := T.N;
		Meio     : Natural;
	begin
		while Primeiro <= Ultimo loop
			Meio := (Primeiro + Ultimo) / 2;		
			if T.Tab(Meio).Nome = Chave then
				return Meio;
			elsif T.Tab(Meio).Nome > Chave then
				Ultimo := Meio - 1;
			else
				Primeiro := Meio + 1;
			end if;
		end loop;
		return 0;
	end Binaria;
end TabelaH.Pesquisa;

with Ada.Text_io
   , Ada.Integer_Text_IO
   , TabelaH
   , TabelaH.Atualiza
   , TabelaH.Ordena
   , TabelaH.Pesquisa;
use  Ada.Text_io
   , Ada.Integer_Text_IO
   , TabelaH
   , TabelaH.Atualiza
   , TabelaH.Ordena
   , TabelaH.Pesquisa;
procedure Testa_Package_Hierarquico is
	T1      : Tabela; 
	T2      : Tabela;
	E       : Elemento;
	Posicao : Natural;

	-- Imprime o conteúdo de uma tabela
	procedure Imprime(T : Tabela; Msg : String) is
	begin
		Put_Line(Msg);
		Put_Line("Posicao Chave      Tag");
		for I in 1 .. Quantos(T) loop
			Put(I,7);
			Put(' ');
			E := Valor(T,I);
			Put(E.Nome);
			Put(E.Tag,5);
			New_Line;
		end loop;
	end Imprime;
			
begin
	-- Inicializa duas tabelas	
	Inicia(T1);
	Inicia(T2);

	-- Insere Chaves nas duas tabelas
	-- Este tipo de teste é chamado de "aramado"	
	-- pois os valores estão "presos" ao programa

	declare 
		Resultado : Boolean;
	begin
		Insere(T1,("Gabriel RK",1010));
		Insere(T1,("Melissa RK",2020));
		Insere(T1,("Claudia AK",1040));
		Insere(T1,("Arthur SR ",4010));
		Insere(T1,("Danilo ER ",5000));
		Insere(T1,("Carmen Z  ",3000));
		Insere(T1,("Ricardo ER",1000));
		Insere(T1,("Elisabeth ",1022));
		Insere(T1,("Lucia FB  ",2311));
		Retira(T1,9,Resultado);
		if not Resultado then
			Put("O elemento da posicao 9 ");
			Put_Line("nao foi retirado.");
		end if;			
		Insere(T1,("Guilherme ",1001));
		Insere(T1,("Lucia FB  ",2311));
		Posicao := Sequencial(T1,"Lucia FB  ");
		if Posicao > 0 then
			E := Valor(T1,Posicao);
			Put(E.Nome & " esta na posicao ");
			Put(Posicao,1);
			Put_Line(".");
		else
			Put_Line("A pesquisa nao teve exito.");
		end if;
		Insere(T1,("Laura F   ",6000));

	exception
		when Tabela_Cheia =>
			Put_Line("Nao pode inserir pois" & 
			         " a tabela esta cheia!");
			Put_Line("Tente outra tabela ou " &
			         "retire algum elemento");
		when others =>
			Put_Line("Operacao nao pode ser " &
			         "completada");
	end;

	Ascendente(T1);		
	Imprime(T1,"Tabela T1 em ordem ascendente:");
	
	Insere(T2,("Beltrano d",2010));
	Insere(T2,("Fulano de ",1010));
	Descendente(T2);
	Imprime(T2,"Tabela T2 em ordem descendente:");
	Ascendente(T2);		
	Imprime(T2,"Tabela T2 em ordem ascendente:");
	Posicao := Binaria(T2,"Fulano de ");
	if Posicao > 0 then
		E := Valor(T2,Posicao);
		Put(E.Nome & " esta na posicao ");
		Put(Posicao,1);
		Put_Line(".");
	else
		Put_Line("A pesquisa nao teve exito.");
	end if;
end Testa_Package_Hierarquico;
