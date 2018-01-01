-- Arquivo fonte Conv_Tm2.Ada
with Ada.Text_IO, Ada.Float_Text_IO
                , Converte_Temperaturas;
use  Ada.Text_IO, Ada.Float_Text_IO
                , Converte_Temperaturas;
procedure Testa_Package_Converte_Temperaturas is
	C : Float;
begin
	C := 30.0;
	while C <= 45.0 loop
		Put(Centigrados(K => Kelvin(C => C)),2,1,0);
		Put(" graus centigrados sao ");
		Put(kelvin(F => Fahrenheit(C => C)),3,2,0);
		Put(" graus Kelvin e ");
		Put(Fahrenheit(C => C),2,1,0);
		Put_Line(" graus Fahrenheit.");
		C := C + 5.0;
	end loop;
end Testa_Package_Converte_Temperaturas;