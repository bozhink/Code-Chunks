pragma List(On);
-- Arquivo fonte Case1.Ada
with Ada.Text_IO; use Ada.Text_IO;
procedure Case_1 is
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
		end case;
	end loop;
end Case_1;