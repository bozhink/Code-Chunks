pragma List(On);
-- Arquivo fonte Case2.Ada
with Ada.Text_IO; use Ada.Text_IO;
procedure Case_2 is
begin
	for Opcao in 'A' .. 'S' loop
		case Opcao is
			when 'A' | 'a' =>
				Put_line("Opcao e' 'A' ou 'a' => " 
					& Opcao);
			when 'B' | 'b' =>
				Put_line("Opcao e' 'B' ou 'b' => " 
					& Opcao);
			when 'C' | 'c' =>
				Put_line("Opcao e' 'C' ou 'c' => " 
					& Opcao);
			when 'S' | 's' =>
				Put_line("Opcao e' 'S' ou 's' => " 
					& Opcao);
			when others =>
				null;
		end case;
	end loop;
end Case_2;