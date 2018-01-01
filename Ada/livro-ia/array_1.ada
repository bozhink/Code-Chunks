-- Arquivo fonte Array_1.Ada
with Ada.Text_IO;
procedure Array_Uma_Dimensao is
	X : array(0..3) of  Integer := (2, 1, 7, 6);
begin
	for I in X'Range loop 
		X(I) := X(I) + 1;
	end loop;
	for I in X'First .. X'Last loop 
		Ada.Text_IO.Put_Line("O valor de " & 
		                                    Character'Val(I + Character'Pos('A')) &
		                                    " e':" & Integer'Image(X(I)));
	end loop;
end Array_Uma_Dimensao;