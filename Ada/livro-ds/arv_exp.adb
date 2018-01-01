-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte Arv_Exp.Adb
with Ada.Text_IO;
use Ada.Text_IO;
package body Arv_Exp is

	-- Algoritmo 7.3 Modificado
	function Calcula(R : Elo) return Integer is
		A, B      : Integer;
		Resultado : Integer;
	begin
		if R /= null then
			if R.Esq = null and R.Dir = null then
				return Character'Pos(R.Op_Val) - 
				       Character'Pos('0');
			end if;
			A := Calcula(R.Esq);
			B := Calcula(R.Dir);
			case R.Op_Val is
				when '+' => return A + B;
				when '-' => return A - B;
				when '*' => return A * B;
				when '/' => return A / B;
				when others => return 0;
			end case;
		else
			return 0;
		end if;
	end Calcula;

	procedure Gera_Expressao(Exp : String; Raiz : in out Elo) is
		Fator    : Integer;
		Temp     : Elo;
		Corrente : Elo;

		function Is_Terminal(Ch : Key) return Boolean is
		begin
			if ((Ch >= 'A') and (Ch <= 'Z')) or
			   ((Ch >= 'a') and (Ch <= 'z')) or
			   ((Ch >= '0') and (Ch <= '9')) then
				return True;
			   else
				return False;
			end if;
		end Is_Terminal;

		function Prioridade(Op : Key) return Integer is
		begin
			if (Op = '+') or (Op = '-') then
				return 2 * Fator;
			elsif (Op = '*') or (Op = '/') then
				return 3 * Fator;
			else
				return 1 * Fator;
			end if;
		end Prioridade;

		function Novo_No(K : Key) return Elo is
			P : Elo;
		begin
			p := new No;
			if P = null then
				Put("*** Novo_No: Memoria insufi");
				Put_Line("ciente para insercao de " &
				    K);
				raise Storage_Error;
			end if;

			if Raiz = null then 
				Raiz     := P;
				Corrente := P;
			end if;

			P.Op_Val := K;
			P.Esq    := null;
			P.Dir    := null;
			P.Pai    := null;
			P.P      := Prioridade(K);
			return P;
		end Novo_No;

		procedure TExp_Insere(Temp : Elo) is
			Stop : Boolean;
		begin
			if Temp /= Raiz then
				if Is_Terminal(Temp.Op_Val) then
					Corrente.Dir := Temp;
				elsif Is_Terminal(Corrente.Op_Val) then 
					Temp.Esq     := Corrente;
					Corrente.Pai := Temp;
					Raiz         := Temp;
					Corrente     := Temp;
				-- É um operador 
				elsif Temp.P > Corrente.P then 
					Temp.Esq     := Corrente.Dir;
					Corrente.Dir := Temp;
					Temp.Pai     := Corrente;
					Corrente     := Temp;
				else 
					-- Encontre o nível adequado 
					Stop := False;
					while not Stop loop
						if Corrente.Pai = null then
							Stop := True;
						elsif Temp.P < Corrente.P then
							if Temp.P > Corrente.Pai.P then
								Stop := True;
							else
								Corrente := Corrente.Pai;
							end if;
						else
							Stop := True;
						end if;
					end loop;

					Temp.Esq := Corrente;
					if Corrente = Raiz then
						Raiz := Temp;
					else
						if Corrente.Pai.Esq = Corrente then
							Corrente.Pai.Esq:= Temp;
						else
							Corrente.Pai.Dir:= Temp;
						end if;
						Temp.Pai     := Corrente.Pai;
						Corrente.Pai := Temp;
					end if;
					Corrente := Temp;
				end if;
			end if;
		end TExp_Insere;

	begin
		Raiz     := null; -- Inicializa árvore
		Fator    := 1;
		for I in Exp'Range loop
			if Exp(I) = '(' then
				Fator := Fator * 4;
			elsif Exp(I) = ')' then
				Fator := Fator / 4;
			else 
				Temp := Novo_No(Exp(I));
				TExp_Insere(Temp);
			end if;
		end loop;
	end Gera_Expressao;

end Arv_Exp;