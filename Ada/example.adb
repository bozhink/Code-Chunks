-- gnatmake -z example.adb

with Ada.Text_IO;

package body Example is
   i : Number := Number'First;
   procedure Print_and_Increment (j : in out Number) is
      function Next(k: in Number) return Number is
	     begin
		    return k+1;
	     end Next;
   begin
      Ada.Text_IO.Put_Line("The total is: " & Number'Image(J));
	  j := Next(j);
   end Print_and_Increment;
   
--package initialization executed when the package is made visible (use clause)
   
begin
  while i<Numbers'Last loop
     Print_and_Increment(i);
  end loop;
end  Example;
