-- (C) 1994-1996 Arthur Vargas Lopes
package body Basic_Sorting is

	procedure Swap(Element_I, Element_K : in out Integer) is
		Temp : Integer;
	begin
		Temp := Element_I;
		Element_I := Element_K;
		Element_K := Temp;
	end Swap;

	procedure Selection_Sort(Data : in out Vector) is
	begin
		for I in Data'First .. Data'Last - 1 loop
			for J in I + 1 .. Data'Last loop
				if Data(I) > Data(J) then 
					Swap(Data(I),Data(J));
				end if;
			end loop;
		end loop;
	end Selection_Sort;

	procedure Shell_Sort(Data : in out Vector)  is
		J           : Integer;
		No_Elements : Integer := Data'Last;
		Distance    : Integer := No_Elements / 2;
	begin
		while Distance > 0 loop
			for I in Distance + 1 .. No_Elements loop
				J := I - Distance;
				while J > 0 loop
					exit when Data(J) <= Data(J+Distance);
					Swap(Data(J), Data(J+Distance));
					J := J - Distance;
				end loop;
			end loop;
			Distance := Distance / 2;
		end loop;
	end Shell_Sort;

end Basic_Sorting;
