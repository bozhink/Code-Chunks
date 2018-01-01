-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte ETF.Adb

with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;
package body Eval_ETF is

	subtype Token is Character;

	Source  : String(1..200); -- Armazena uma expressão 
	ISource : Integer;        -- Índice do próximo caractere 
	Ultima  : Token;          -- Caractere look ahead 
	LAhead  : Boolean;        -- Sinaliza look ahead ativo 

	procedure Inicializa(S : String) is
	begin
		Source(1..S'Length) := S;
		Isource             := 1;
		LAhead              := False;
	end Inicializa;

	-- Obtém um símbolo de Source 
	function Scanner return Token is
		Tk : Token;
	begin
		if LAhead then -- Retorna a token recebida por Back 
			Tk      := Ultima;
			LAhead  := False;
		else
			Tk      := Source(ISource);
			ISource := ISource + 1;
			-- Ignora brancos 
			while (Tk = ' ') loop
				Tk      := Source(ISource);
				ISource := ISource + 1;
			end loop;
		end if;

		return Tk;
	end Scanner; 

	-- Salva Tk no buffer de look ahead 
	procedure Back(Tk : Token) is
	begin
		LAhead := True;
		Ultima := Tk;
	end Back;

	-- Obtém um fator 
	function F return Integer is

		Tk : Token;
		R  : Integer;
	begin
		Tk := Scanner;

		if Tk = '(' then -- Processa ( E ) 

			R := E;

			Tk := Scanner;

			if Tk /= ')' then
				Put("Expressao invalida ==> ");
				Put(Tk);
				New_Line;
				raise Expressao_Invalida;
			end if;
		elsif Tk not in '0' .. '9' then
			Put("Expressao invalida ==> ");
			Put(Tk);
			New_Line;
			raise Expressao_Invalida;
		else	-- Converte um dígito para seu valor decimal 
			R := Character'Pos(Tk) - Character'Pos('0');
		end if;

		return R;

	end F; 

	-- Obtém um termo 
	function T return Integer is
		Tk  : Token;
		Op1 : Integer;
		Op2 : Integer;
	begin
		Op1 := F;

		Tk := Scanner;

		while (Tk = '*') or (Tk = '/') loop

			Op2 := F;

			-- Avalia a sub-expressão 
			if Tk = '*' then
				Op1 := Op1 * Op2;
			else  -- Testar divisão por zero 
				Op1 := Op1 / Op2;
			end if;

			Tk := Scanner;

		end loop;

		Back(Tk);

		return Op1;
	end T; 

	-- Obtém uma expressão 
	function E return Integer is
		Tk  : Token;
		Op1 : Integer;
		Op2 : Integer;
	begin
		Op1 := T;

		Tk := Scanner;

		while (Tk = '+') or (Tk = '-') loop

			Op2 := T;

			-- Avalia a sub-expressão 
			if Tk = '+' then
				Op1 := Op1 + Op2;
			else
				Op1 := Op1 - Op2;
			end if;

			Tk := Scanner;

		end loop;

		Back(Tk);

		return Op1;
	end E; 

end Eval_ETF;
