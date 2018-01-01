-- Arquivo fonte Integer.Ada
with Ada.Text_IO;
procedure Integer_Input_Output is
	package ES_Int 
		is new Ada.Text_IO.Integer_IO(Integer);

	S : constant String := "123 ";
	L : Integer;	
	N : Integer;
begin
	ES_Int.Get(S,N,L);
	Ada.Text_IO.Put(S & "convertido para Integer e' [");
	ES_Int.Put(N,L);
	Ada.Text_IO.Put_Line("]");
end Integer_Input_Output;