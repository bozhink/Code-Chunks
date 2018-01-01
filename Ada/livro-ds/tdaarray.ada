-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte TDAArray.Ada
with Ada.Text_IO, Ada.Integer_Text_IO, Arrays;
use  Ada.Text_IO, Ada.Integer_Text_IO, Arrays;
procedure Testa_TDA_Array is
	Va : Vetor_Integer(1..4) := (1, 2, 3, 4);
	Vb : Vetor_Integer(1..4) := (4, 3, 2, 1);
	Vr :  Vetor_Integer(1..4);
	Ma : Matriz_Integer(1..2,1..4) := ((1, 2, 3, 4),(0,1,2,3));
	Mb : Matriz_Integer(1..2,1..4) := ((4, 3, 2, 1),(1,2,3,0));
	Mr :  Matriz_Integer(1..2,1..4);
	
	procedure Imprime_Vetor(Msg : String; V : Vetor_Integer) is
	begin
		Put(Msg);
		for I in V'Range loop
			Put(V(I), 2);
		end loop;
		New_Line;
	end Imprime_Vetor;

	procedure Imprime_Matriz(Msg : String; M : Matriz_Integer) is
	begin
		Put_Line(Msg);
		for I in M'Range loop
			for J in M'Range(2) loop
				Put(M(I,J), 2);
			end loop;
			New_Line;
		end loop;
	end Imprime_Matriz;
begin
	Imprime_Vetor("Va = ",Va);
	Imprime_Vetor("Vb = ",Vb);
	Vr := Va + Vb; -- Armazena a soma dos vetores Va e Vb em Vr
	Imprime_Vetor("Vr = ",Vr);

	Imprime_Matriz("Ma = ",Ma);
	Imprime_Matriz("Mb = ",Mb);
	Mr := Ma + Mb; -- Armazena a soma das matrizes Ma e Mb em Mr
	Imprime_Matriz("Mr = ",Mr);

end Testa_TDA_Array;