-- (C) 1994-1996 Arthur Vargas Lopes
package Basic_Sorting is

	type Vector is array(Integer range <>) of Integer;

	procedure Selection_Sort(Data : in out Vector);
	procedure Shell_Sort(Data : in out Vector);

end Basic_Sorting;