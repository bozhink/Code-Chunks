-- Arquivo fonte MDC.Ada
with Ada.Text_IO, Ada.Integer_Text_IO;
procedure Maior_Divisor_Comum is
	M, N, R, MDC : Integer;
begin	
	-- Obtenha valores para M e N do teclado
	Ada.Text_IO.Put("Tecle dois numeros inteiros e depois <ENTER>: ");
	Ada.Integer_Text_IO.Get(M);	
	Ada.Integer_Text_IO.Get(N);	

	Ada.Text_IO.Put_Line("Os valores lidos foram " &
	                                    Integer'Image(M) & " e " &
	                                    Integer'Image(N));

	-- Passo 1: Divida M por N e coloque o resto em R;
	R := M mod N;
	
	-- Passo 2: Enquanto o valor de R for diferente de zero realize:
	while R /= 0 loop

		-- Passo 2.1: Substitua o valor de M pelo valor de N;
		M := N;

		-- Passo 2.2: Substitua o valor de N pelo valor de R;
		N := R;

		-- Passo 2.3: Divida M por N e coloque o resto em R.
		R := M mod N;
	end loop;

	-- Passo 3: MDC recebe o último valor de N, que é o maior divisor comum!
	MDC := N;
	
	Ada.Text_IO.Put_Line("O maior divisor comum e': " & Integer'Image(MDC));

end Maior_Divisor_Comum;
