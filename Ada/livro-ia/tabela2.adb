-- Arquivo fonte Tabela2.Adb
package body Tabela_Para_Inteiros_2 is

	procedure Inicia(Tab : out Tabela) is
	begin
		Tab.N := Intervalo'First - 1;
	end Inicia;

	procedure Insere(Tab : in out Tabela; Quem : Tipo) is
	begin
		if Tab.N = (Intervalo'Last - Intervalo'First + 1) then
			raise Tabela_Cheia;
		end if;
		Tab.N := Tab.N + 1;
		Tab.T(Tab.N) := Quem;
	end insere;

	function Pesquisa(Tab : Tabela; Quem : Tipo)
			return Integer is
	begin
		for I in Intervalo'First .. Tab.N loop
			if Tab.T(I) = Quem then
				return I;
			end if;
		end loop;
		return intervalo'First - 1;
	end Pesquisa;

	function Valor(Tab : Tabela; Indice : Intervalo)
			return Tipo is
	begin
		return Tab.T(Indice);
	end Valor;

	function Quantos(Tab : Tabela) return Integer is
	begin
		return Tab.N;
	end Quantos;

	procedure Retira(Tab : in out Tabela; 
	                 Onde : Intervalo) is
	begin
		if Tab.N = (Intervalo'First - 1) then
			raise Tabela_Vazia;
		end if;
		null; -- Complete
	end Retira;
	
end Tabela_Para_Inteiros_2;