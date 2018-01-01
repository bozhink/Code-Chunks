-- (C) 1996 Arthur Vargas Lopes
-- Arquivo fonte Primo.Ada
with Ada.Text_IO, Ada.Integer_Text_IO;
procedure Numeros_Primos is
	A, B, Tenta, Teste, Quantos_Primos : Integer := 0;
	Nao_Primo : Boolean;
begin
	Ada.Text_IO.Put("Busca de numeros primos");
	Ada.Text_IO.Put_Line(" maiores que 2.");

<<De_Novo>>
	-- Passo 1: Obtenha os valores do primeiro e
	-- do último número;
	Ada.Text_IO.Put("Especifique o primeiro valor");
	Ada.Text_IO.Put(" inteiro e positivo: ");
	Ada.Integer_Text_IO.Get(A);
	
	Ada.Text_IO.Put("Especifique o ultimo valor");
	Ada.Text_IO.Put(" inteiro e positivo: ");
	Ada.Integer_Text_IO.Get(B);

	-- Passo 2
	if A  < 3 or A > B then
		goto De_Novo;
	end if;

	Ada.Text_IO.New_Line(2);

	-- Explique para o usuário o que o programa está fazendo
	Ada.Text_IO.Put("Iniciando a pesquisa de numeros primos");
	Ada.Text_IO.Put(" entre [");
	Ada.Integer_Text_IO.Put(A,1);
	Ada.Text_IO.Put(", "); 
	Ada.Integer_Text_IO.Put(B,1);
	Ada.Text_IO.Put_Line("]"); 
	Ada.Text_IO.New_Line;

	-- Passo 3: Copie A para Tenta;
	Tenta := A;

	-- Passo 4: Enqualto o valor de Tenta for menor ou
	-- igual ao valor de B realize:
	while Tenta <= B loop

		Teste := 2; -- Passo 4.1: Copie 2 para Teste;
		
		Nao_Primo := false; 	-- Passo 4.2: Copie false 
					-- para Nao_Primo;

		-- Passo 4.3: Enquanto Teste < Tenta e Nao_Primo
		-- for false realize:
		while Teste < Tenta and not Nao_Primo loop

			-- Passo 4.3.1: Se o resto da divisão de 
			-- Tenta por Teste for igual a zero então
			-- Tenta não é primo;
			if (Tenta mod Teste) = 0 then

				-- Passo 4.3.1.1: Copie true 
				-- para Nao_Primo;
				Nao_Primo := true;
			end if;

			 Teste := Teste + 1; 	-- Passo 4.3.2: Adicione
						-- 1 em Teste;
		end loop;

		-- Passo 4.4: Se Nao_Primo for igual a false então:
		if not Nao_Primo then

			-- Passo 4.4.1: Exiba na tela que o número
			-- Tenta é primo;
			Ada.Text_IO.Put("O numero ");
			Ada.Integer_Text_IO.Put(Tenta,1);
			Ada.Text_IO.Put_Line(" e' primo.");

			-- Passo 4.4.2: Adicione 1 ao contador de
			-- números primos, Quantos_Primos;
			Quantos_Primos := Quantos_Primos + 1;
		end if;

		Tenta := Tenta + 1;	-- Passo 4.5: Adicione 1
					-- em Tenta;
	end loop;

	-- Passo 5: Se Quantos_Primos é igual a zero então indique 
	-- 		que nenhum número primo foi encontrado;
	if Quantos_Primos = 0 then
		Ada.Text_IO.Put("Nenhum numero primo ");
		Ada.Text_IO.Put_Line("foi encontrado!");
	elsif Quantos_Primos = 1 then
		Ada.Text_IO.Put("A penas um numero primo ");
		Ada.Text_IO.Put_Line("foi encontrado.");
	else
		Ada.Integer_Text_IO.Put(Quantos_Primos,1);
		Ada.Text_IO.Put(" numeros primos foram");
		Ada.Text_IO.Put_Line(" encontrados.");
	end if;
end Numeros_Primos;