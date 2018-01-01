-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO, Ada.Unchecked_Deallocation; 
use Ada.Text_IO;

procedure Access_Type is

    type Node;
    type Node_Ptr is access Node;
    
    type Node is record
        IValue : Integer;
        Link   : Node_Ptr;
        end record;

    procedure Free is new 
       Ada.Unchecked_Deallocation(Node,Node_Ptr);

    Head : Node_Ptr;
    Temp : Node_Ptr;
    Old  : Node_Ptr;

begin
    Head        := new Node;
    Head.IValue := 1001;
    Head.Link   := new Node;
    Head.Link.Ivalue := 2002;
    Head.Link.Link   := null;
    Temp := Head;
    while Temp /= null loop
        Put("Ivalue ");
        Put_Line(Integer'Image(Temp.Ivalue));
        Old := Temp;
        Temp := Temp.Link;
        Free(Old);
    end loop;
end Access_Type;