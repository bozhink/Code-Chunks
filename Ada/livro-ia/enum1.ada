pragma List(On);
-- Arquivo fonte Enum1.Ada
with Ada.Text_IO
   , Ada.Integer_Text_IO
   , Ada.Float_Text_IO;
use Ada.Text_IO
  , Ada.Integer_Text_IO
  , Ada.Float_Text_IO;
procedure Enumera_1 is

	type Tipos_De_Despesas 
		is (Alimentacao, Transporte, Moradia);
	subtype Dias is Integer range 1 .. 31;

	-- Objeto para armazenar as despesas
	-- em cada dia de um mês
	Despesas : array( Dias, Tipos_De_Despesas) 
			of Float
		   := (others => (others => 0.0));

	Opcao    : Character;

	Despesa  : Tipos_De_Despesas;

	-- Disponibilize operações de entrada e
	-- saída para Tipos_De_Despesas
	package ES_Para_Tipos_De_Despesas 
		is new Ada.Text_IO.Enumeration_IO
			(Tipos_De_Despesas);

	use ES_Para_Tipos_De_Despesas;

begin
	for Dia in Dias loop

		New_Line(24);
		Put("Selecione um tipo de ");
		Put("despesa para o dia ");
		Put(Integer'Image(Dia) & ":");

		for I in Tipos_De_Despesas loop
			New_Line(2);
			Put("   " & 
			    Character'Val
			     (Tipos_De_Despesas'Pos(I) + 65)
			   );
			Put(" <---> ");
			Put(I, Width => 11);
			New_Line;
		end loop;
		New_Line(2);
		Put("   ");
		Put_Line("S <---> SEM DESPESAS NO DIA");
		New_Line(2);
		Put("   ");
		Put_Line("F <---> FIM");
		New_Line(2);
		Put("Entre A, B, C, S ou F e depois ENTER: ");

		Get(Opcao);
		Skip_Line;

		New_Line(3);

		exit when Opcao = 'F' or Opcao = 'f';
	
		case Opcao is

			when 'A' | 'a' =>
				Despesa := Alimentacao;
				
			when 'B' | 'b' =>
				Despesa := Transporte;
				
			when 'C' | 'c' =>
				Despesa := Moradia;

			when 'S' | 's' =>
				null;

			when others =>
				Put (Item => ASCII.BEL);
				Opcao := ' ';
		end case;
			
		if Opcao /= ' ' then -- Se Opcao não é inválida
			if Opcao /= 'S' and Opcao /= 's' then
				Put("Digite a despesa com ");
				Put(Despesa);
				Put(": ");
				Get(Despesas(Dia,Despesa));
			end if;
		end if;
	end loop;

	-- Agora vamos imprimir o conteúdo da Matriz de Despesas
	Put("    ");
	Put("Alimentacao");
	Put("  Transporte");
	Put_Line("     Moradia");
	for Dia in Dias loop
		if Despesas(Dia,Alimentacao) /= 0.0 or
		       Despesas(Dia,Transporte) /= 0.0 or
		       Despesas(Dia,Moradia) /= 0.0 then
			Put(Dia,3);
			for D in Tipos_De_Despesas loop
				Put(Despesas(Dia,D),9,2,0);
			end loop;
			New_Line;
		end if;
	end loop;

end Enumera_1;
