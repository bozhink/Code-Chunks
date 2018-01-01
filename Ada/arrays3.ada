-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO; use Ada.Text_IO;
procedure Arrays_3 is
	type Two_Dimensional_Array
		is array (Integer Range <>, Integer range <>) of Integer;
	Mat_1, Mat_2 : Two_Dimensional_Array(1 .. 2, 3 .. 4);
begin
	Mat_1 := ((13,14),(23,24));
	Mat_2 := Mat_1;
	for Row in Two_Dimensional_Array'Range loop
		for Column in Two_Dimensional_Array'Range(2) loop
			Put_Line("Mat_2(" & Integer'Image(Row) & ','
			                  & Integer'Image(Column) & ") = "
			                  & Integer'Image(Mat_2(Row,Column)));
		end loop;
	end loop;
end Arrays_3;