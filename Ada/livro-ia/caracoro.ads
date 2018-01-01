-- (C) 1994-1996 Arthur Vargas Lopes

with Ada.Text_IO; -- Arquivo fonte CaraCoro.Ada
package Cara_Coroa is
	type Faces_Da_Moeda is (Cara, Coroa);
	function Atira_Moeda return Faces_Da_Moeda;
	package Enum_IO is new Ada.Text_IO.Enumeration_IO(Faces_Da_Moeda);
	use Enum_IO;
end Cara_Coroa;