pragma List(On);
-- Arquivo fonte SubTipo2.Ada
with Ada.Text_IO, Ada.Float_Text_IO;
use Ada.Float_Text_IO;
procedure Sub_Tipo_2 is

	subtype Pequeno_Float is 
		Float range -4.0 .. 4.0;

	Valor_Qualquer : Float;
	Valor_Pequeno  : Pequeno_Float;

begin

	Valor_Qualquer := 100.15;
	Put(Valor_Qualquer);
	Ada.Text_IO.New_Line;

	Valor_Pequeno := 100.15;
	Put(Valor_Pequeno);
	Ada.Text_IO.New_Line;

end Sub_Tipo_2;