-- Arquivo fonte Extenso.Adb
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
package body Extenso is
	
	LV    : String(1 .. 9); -- Valor em formato String
	Linha : String(1 .. 512); -- Valor por extenso
	N     : Integer; -- Comprimento lógico de Linha

	procedure Preenche(S : String) is
		Old_N : Integer;
	begin
		Old_N := N + 1;
		N := N + (S'Last - S'First + 1);
		Linha(Old_N .. N) := S;
	end Preenche;

	procedure Unidade(U : Character) is
	begin
		if N > 0 and U /= ' ' and U /= '0' then
			Preenche("e ");
		end if;
		case U is
			when '1' => Preenche("um ");
			when '2' => Preenche("dois ");
			when '3' => Preenche("tres ");
			when '4' => Preenche("quatro ");
			when '5' => Preenche("cinco ");
			when '6' => Preenche("seis ");
			when '7' => Preenche("sete ");
			when '8' => Preenche("oito ");
			when '9' => Preenche("nove ");
			when others => null;
		end case;
	end Unidade;

	procedure Dezena(D : Character; U : Character) is
	begin
		if N > 0 and D /= ' ' and D /= '0' then
			Preenche("e ");
		end if;
		if D = '1' and U > '0' then
			case U is
				when '1' => Preenche("onze ");
				when '2' => Preenche("doze ");
				when '3' => Preenche("treze ");
				when '4' => Preenche("quatorze ");
				when '5' => Preenche("quinze ");
				when '6' => Preenche("dezesseis ");
				when '7' => Preenche("dezesete ");
				when '8' => Preenche("dezoito ");
				when '9' => Preenche("dezenove ");
				when others => null;
			end case;	
		else
			case D is
				when '1' => Preenche("dez ");
				when '2' => Preenche("vinte ");
				when '3' => Preenche("trinta ");
				when '4' => Preenche("quarenta ");
				when '5' => Preenche("cinquenta ");
				when '6' => Preenche("sessenta ");
				when '7' => Preenche("setenta ");
				when '8' => Preenche("oitenta ");
				when '9' => Preenche("noventa ");
				when others => null;
			end case;	
			Unidade(U);
		end if;
	end Dezena;

	procedure Centena(C : Character; Depois : Boolean) is
	begin
		if N > 0 and C >= '1' then
			Preenche("e ");
		end if;
		case C is
			when '1' =>
				if Depois then
					Preenche("cento ");
				else
					Preenche("cem ");
				end if;
			when '2' => Preenche("duzentos ");
			when '3' => Preenche("trezentos ");
			when '4' => Preenche("quatrocentos ");
			when '5' => Preenche("quinhentos ");
			when '6' => Preenche("seissentos ");
			when '7' => Preenche("setecentos ");
			when '8' => Preenche("oitocentos ");
			when '9' => Preenche("novecentos ");
			when others => null;
		end case;
	end Centena;

	procedure Edita_Valor(V : Float; R : out Valor_Editado) is
	begin
		if V < 0.01 or V > 999999.99 then
			raise Constraint_Error;
		end if;
		Put(R,V,2,0);
		if R(7) = ' ' then 
			R(7) := '0';
		end if;
		if V > 999.99 then
			R(1) := R(2);
			R(2) := R(3);
			R(3) := R(4);
			R(4) := '.';
		end if;
		R(8) := ',';
		for I in 1 .. 6 loop
			if R(I) = ' ' then
				R(I) := '*';
			end if;
		end loop;
	end Edita_Valor;

	function Valor_Por_Extenso(V : Float) return String is
		Depois : Boolean := True;
		I      : Long_Integer := 0;
	begin
		if V < 0.01 or V > 999999.99 then
			raise Constraint_Error;
		end if;

		N := 0;

		Put(LV,V,2,0);

		if V > 0.99 then
			if LV(2) = '0' and LV(3) /= '0' then
				Depois := False;
			end if;
			Centena(LV(1),Depois);
			Dezena(LV(2),LV(3));
			if V > 999.99 then
				Preenche("mil ");
			end if;
			if LV(2) = '0' and LV(3) /= '0' then
				Depois := False;
			else
				Depois := True;
			end if;
			Centena(LV(4),Depois);
			Dezena(LV(5),LV(6));
			I := Long_Integer(V);
			if I > 1 then
				Preenche("reais");
			else
				Preenche("real");
			end if;
		end if;
		if LV(8) /= ' ' and LV(9) /= ' ' then
			if I > 0 then
				Preenche(" ");
			end if;			
			Dezena(LV(8),LV(9));
			if LV(8) >= '1' or LV(9) > '1' then
				Preenche("centavos");
			else
				Preenche("centavo");
			end if;
		end if;
		return Linha(1 .. N);
	end Valor_Por_Extenso;
end Extenso;