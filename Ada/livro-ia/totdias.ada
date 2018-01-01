-- Arquivo fonte TotDias.Ada
with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO;
procedure Total_De_Dias_Entre_Duas_Datas is
	 Inicio_Dia
	,Inicio_Mes
	,Inicio_Ano   : Integer; -- Data inicial
	 Fim_Dia
	,Fim_Mes
	,Fim_Ano      : Integer; -- Data final
	Dia, Mes, Ano : Integer; -- Data corrente
	C : Integer;		 -- Total de dias
	Tot_Dias : array(1..12) of Integer 
	     := (31,28,31,30,31,30,31,31,30,31,30,31);
begin
	-- Passo 1: Obtenha a data inicial e 
	-- a data final;
	Put("Entre com a data inicial");
	Put(" (como por exemplo 15 3 1995): ");
	Ada.Integer_Text_IO.Get(Inicio_Dia);
	Ada.Integer_Text_IO.Get(Inicio_Mes);
	Ada.Integer_Text_IO.Get(Inicio_Ano);
	Put("Entre com a data final ");
	Put("como por exemplo 14 2 1996): ");
	Ada.Integer_Text_IO.Get(Fim_Dia);
	Ada.Integer_Text_IO.Get(Fim_Mes);
	Ada.Integer_Text_IO.Get(FIm_Ano);

	-- Passo 2: Copia a data inicial para a 
	-- data corrente;
	Dia := Inicio_Dia;
	Mes := Inicio_Mes;
	Ano := Inicio_Ano;

	-- Passo 3: Zere o contador de dias, C;
	C := 0;

	-- Passo 4: Ajuste o total de dias para o mês 
	-- de fevereiro se o ano for bissexto;
	if ((Ano mod 100 /= 0) and (Ano mod 4) = 0) 
			or ((Ano mod 400) = 0) then
		Tot_Dias(2) := 29;
	end if;	

	-- Passo 5: Saia do loop quando a data 
	-- corrente for igual a data final
	while not (Dia >= Fim_Dia and Mes >= Fim_Mes 
	             and Ano >= Fim_Ano) loop

		-- Passo 5.1: Incremente C e Dia;
		C := C + 1;
		Dia := Dia + 1;

		-- Passo 5.2: Se dia é igual ao total 
		-- de dias do mês então:
		if Dia > Tot_Dias(Mes) then
			-- Passo 5.2.1: Copie 1 
			-- para Dia;
			Dia := 1;
			-- Passo 5.2.2: Se Mes 
			-- é 12 então:   
			if Mes >= 12 then
				-- Passo 5.2.2.1: Incremente
				-- Ano;  
				Ano := Ano + 1;
				-- Passo 5.2.2.1: Copie 1
				-- para Mes;
				Mes := 1;
			-- Passo 5.2.3: Senão
			else
				-- Passo 5.2.3.1: Incremente
				-- Mes;
				Mes := Mes + 1;
				-- Passo 5.2.3.2: Ajuste Tot_Dias(2) 
				if ((Ano mod 100 /= 0) 
					and (Ano mod 4) = 0) or
					((Ano mod 400) = 0) then
					Tot_Dias(2) := 29; -- Ano 
					            -- e' bissexto
				else
					Tot_Dias(2) := 28; 
				end if;
			end if;
		end if;
	end loop;
	
	-- Passo 6: Anuncie na tela o total de dias, C, 
	-- entre as duas datas.
	Put("O total de dias e': ");
	Ada.Integer_Text_IO.Put(C);
	New_Line;
end Total_De_Dias_Entre_Duas_Datas;