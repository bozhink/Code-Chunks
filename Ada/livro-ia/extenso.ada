-- Arquivo fonte Extenso.Ada
with Ada.Text_IO, Extenso;
use  Ada.Text_IO, Extenso;
procedure Testa_Extenso is
	F  : Float := 0.01;
	VE : Valor_Editado; 
begin
	while F <= 999999.99 loop	
		Edita_Valor(F,VE);
		Put(VE);
		Put_Line('[' & Valor_Por_Extenso(F) & ']');
		F := F + 0.12;
		Edita_Valor(F,VE);
		Put(VE);
		Put_Line('[' & Valor_Por_Extenso(F) & ']');
		F := F * 10.0;
	end loop;
end Testa_Extenso;