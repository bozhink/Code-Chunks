-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO, Ada.Unchecked_Deallocation; 
use Ada.Text_IO;

procedure Test_Free_Memory is
	type Node;
	type Node_Ptr is access Node;
	type Node is record
		Id   : Integer;
		Next : Node_Ptr;
		end record;
	procedure Free is new Ada.Unchecked_Deallocation(Node,Node_Ptr);
	Head, N1 : Node_Ptr;
begin
	Head := New Node;
	Free(Head);
end Test_Free_Memory;