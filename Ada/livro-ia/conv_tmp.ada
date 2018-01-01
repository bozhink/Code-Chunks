-- Arquivo fonte Conv_Tmp.Ada
with Ada.Text_IO, Ada.Float_Text_IO;
procedure Converte_Temperaturas is

	Centigrados	: Float := 20.0;
	Kelvin		: Float;

	type Temperatura is (C, K, F);

	-- Converte temperaturas
	function Converte_Temperatura(Temp : in Float; 
	                              De   : in Temperatura;
	                              Para : in Temperatura) 
		      return Float is
		Centigrados : Float;
	begin
		case De is
			when K => 
				Centigrados := Temp - 273.15;
			when F => 
				Centigrados := (Temp - 32.0) * 5.0 / 9.0;
			when C => 
				Centigrados := Temp;
		end case;

		case Para is
			when K => 
				return Centigrados + 273.15;
			when F => 
				return Centigrados / 5.0 * 9.0 + 32.0;
			when C =>
				return Centigrados;
		end case;
	end Converte_Temperatura;
begin

	Kelvin := Converte_Temperatura(Centigrados,C,K);

	-- Exibe na tela a temperatura em graus Kelvin.
	Ada.Float_Text_IO.Put(Kelvin,Aft=>2,Exp=>0);

	Ada.Text_IO.New_Line; -- Move o cursor para o início da próxima 
	                      -- linha na tela.

	Centigrados := Converte_Temperatura(293.15,K,C);

	-- Exibe na tela a temperatura em graus centigrados.
	Ada.Float_Text_IO.Put(Centigrados,Aft=>1,Exp=>0);

	Ada.Text_IO.New_Line; -- Move o cursor para o início da próxima 
	                      -- linha na tela.
end Converte_Temperaturas;