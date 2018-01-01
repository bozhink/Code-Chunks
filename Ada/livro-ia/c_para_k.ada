-- Arquivo fonte C_Para_K.Ada
with Ada.Text_IO, Ada.Float_Text_IO;
procedure Converte_Graus_C_Para_K is

	Centigrados	: Float := 20.0;
	Kelvin		: Float;

	-- Converte temperatura de centígrados para Kelvin
	function Converte_Temp_C_Para_K(Temperatura : Float) return Float is
		Temp : Float;
	begin
		Temp := Temperatura + 273.15;
		return Temp;
	end Converte_Temp_C_Para_K;
begin

	Kelvin := Converte_Temp_C_Para_K(Centigrados);

	-- Exibe na tela a temperatura em graus Kelvin.
	Ada.Float_Text_IO.Put(Kelvin,Aft=>2,Exp=>0);

	Ada.Text_IO.New_Line; -- Move o cursor para o início da próxima 
	                      -- linha na tela.

end Converte_Graus_C_Para_K;