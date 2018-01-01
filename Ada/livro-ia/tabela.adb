-- Arquivo fonte Tabela.Adb
package body Tabela_Para_Inteiros is

	procedure Inicia(Tab : out Tabela) is
	begin
		Tab.N := Intervalo'First - 1;
	end Inicia;

	procedure Insere(Tab : in out Tabela; Quem : Tipo) is
	begin
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

	procedure Retira(Tab : in out Tabela; 
	                 Onde : Intervalo) is
	begin
		null; -- Complete
	end Retira;
	
end Tabela_Para_Inteiros;