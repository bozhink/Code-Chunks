-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO, Ada.Unchecked_Deallocation, Ada.Unchecked_Conversion; 
use Ada.Text_IO;

procedure Test_Unchecked_Conversion is
	type Node;
	type Node_Ptr is access Node;
	type Node is record
		Id   : Integer;
		Next : Node_Ptr;
		end record;
	procedure Free is new Ada.Unchecked_Deallocation(Node,Node_Ptr);
	function Conv is new Ada.Unchecked_Conversion(Node_Ptr,Long_Integer);
	package Long_IO is new Integer_IO(Long_Integer); use Long_IO;
	Head, N1 : Node_Ptr;
	Addr     : Long_Integer;
begin
	Head := new Node;
	Addr := Conv(Head);
	Put("The address of head is ");
	Put(Addr);
	New_Line;
	Free(Head);
end Test_Unchecked_Conversion;