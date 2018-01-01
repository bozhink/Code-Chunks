-- Arquivo fonte TotDias2.Ada
with Ada.Text_IO, Ada.Integer_Text_IO;
procedure Total_De_Dias_Entre_Duas_Datas2 is
	 Inicio_Dia
	,Inicio_Mes
	,Inicio_Ano : Integer;	-- Data inicial

	 Fim_Dia
	,Fim_Mes
	,Fim_Ano    : Integer;	-- Data final
	C           : Integer;	-- Total de dias
	Tot_Dias    : array(1..12) of Integer 
	  := (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
begin
	-- Passo 1: Obtenha a data inicial e a data final;
	Ada.Text_IO.Put("Entre com a data inicial ");
	Ada.Text_IO.Put("(como por exemplo 15 3 1995): ");
	Ada.Integer_Text_IO.Get(Inicio_Dia);
	Ada.Integer_Text_IO.Get(Inicio_Mes);
	Ada.Integer_Text_IO.Get(Inicio_Ano);
	Ada.Text_IO.Put("Entre com a data final ");
	Ada.Text_IO.Put("(como por exemplo 14 2 1996): ");
	Ada.Integer_Text_IO.Get(Fim_Dia);
	Ada.Integer_Text_IO.Get(Fim_Mes);
	Ada.Integer_Text_IO.Get(FIm_Ano);

	-- Passo 2: Ajuste o total de dias para o mês de
	-- fevereiro se o ano for bissexto;
	if ((Inicio_Ano mod 100 /= 0) and (Inicio_Ano mod 4) = 0) 
			or ((Inicio_Ano mod 400) = 0) then
		Tot_Dias(2) := 29;
	end if;	

	-- Passo 3: Calcule o número de dias do primeiro mês;
	C := Tot_Dias(Inicio_Mes) - Inicio_Dia;

	-- Passo 4: Se o ano inicial é igual ao ano final então 
	-- some os dias entre o mês inicial e o mês final;
	if Inicio_Ano = Fim_Ano then
		for Mes in Inicio_Mes + 1 .. Fim_Mes - 1 loop
			C := C + Tot_Dias(Mes);        
		end loop;
	else 
	-- Passo 5: Some os dias entre as duas datas excluindo 
	-- o mês-ano inicial e o mês-ano final se o passo 4 não
	-- é executado;
		-- Passo 5.1: Some os dias do primeiro ano;
		for Mes in Inicio_Mes + 1 .. 12 loop
			C := C + Tot_Dias(Mes);        
		end loop;

		-- Passo 5.2: Ajuste o número de dias de 
		-- fevereiro do último ano;
		if ((Fim_Ano mod 100 /= 0) and (Fim_Ano mod 4) = 0) 
				or ((Fim_Ano mod 400) = 0) then
			Tot_Dias(2) := 29;
		else
			Tot_Dias(2) := 28;
		end if;	

		-- Passo 5.3: Some os dias do último ano 
		-- excluindo o último mês;
		for Mes in 1 .. Fim_Mes - 1 loop
			C := C + Tot_Dias(Mes);        
		end loop;

		-- Passo 5.4: Ajuste os anos bissextos;
		for Ano in Inicio_Ano + 1 .. Fim_Ano - 1 loop
			if ((Ano mod 100 /= 0) and (Ano mod 4) = 0) 
				    or ((Ano mod 400) = 0) then
				C := C + 1;
			end if;	
		end loop;

		-- Passo 5.5: Some o número de dias entre o ano 
		-- inicial e o ano final;
		C := C + 365 * (Fim_Ano - Inicio_Ano - 1);
	end if;

	-- Passo 6: Calcule o número de dias do último mês se 
	-- não for mesmo mês e mesmo ano;
	if not (Inicio_Ano = Fim_Ano and 
			Inicio_Mes = Fim_Mes) then
		C := C + Fim_Dia;
	end if;

	-- Passo 7: Anuncie na tela o total de dias, C, entre
	-- as duas datas.
	Ada.Text_IO.Put("O total de dias e': ");
	Ada.Integer_Text_IO.Put(C);
	Ada.Text_IO.New_Line;
end Total_De_Dias_Entre_Duas_Datas2;