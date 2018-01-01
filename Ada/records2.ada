with Ada.Text_IO; use Ada.Text_IO;
procedure Record_Discriminant is
	type Name(Length : NATURAL := 6) is record
		Last  : String(1 .. Length);
		First : String(1 .. Length);
		M_I   : Character := ' ';
		end record;
	Senna : Name;
	Pele  : Name(10); 
	Len   : Integer;
begin
	Put("Enter the last name of Senna with " & 
	    Integer'Image(Senna.Last'Last) &
	    " characteres: ");
	Get_Line(Senna.Last,Len);
	Put("Enter the first name of Senna with " & 
	    Integer'Image(Senna.First'Last) &
	    " characteres: ");
	Get_Line(Senna.First,Len);
	Put("Enter the last name of Pele with " & 
	    Integer'Image(Pele.Last'Last) &
	    " characteres: ");
	Get_Line(Pele.Last,Len);
	Put("Enter the first name of Pele with " & 
	    Integer'Image(Pele.First'Last) &
	    " characteres: ");
	Get_Line(Pele.First,Len);
	Put("Enter the midle initial of Pele: ");
	Get(Pele.M_I);
	New_Line;
	Put_Line(Senna.Last & ' ' & Senna.First);
	Put_Line(Pele.Last & ' ' & Pele.First & ' ' & Pele.M_I);
end Record_Discriminant;