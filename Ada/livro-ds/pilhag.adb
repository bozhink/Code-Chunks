-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte PilhaG.Adb
package body PilhaG is

	-- Implementação do algoritmo 3.1 
	procedure Inicializa(P : in out Pilha) is
	begin
		P.Sp := P.V'First - 1;
	end Inicializa;

	-- Implementação do algoritmo 3.2
	procedure Push(P : in out Pilha; D : Tipo) is
	begin
		if P.Sp = P.V'Last then  -- Verifica overflow de pilha 
			raise Overflow;
		else
			P.Sp := P.Sp + 1;
			P.V(P.Sp) := D;
		end if;
	end Push;

	-- Implementação do algoritmo 3.3 
	procedure Pop(P : in out Pilha; R : out Tipo) is
	begin
		if P.Sp < P.V'First then  -- Verifica underflow de pilha 
			raise Underflow;
		else
			R := P.V(P.Sp);
			P.Sp := P.Sp - 1;
		end if;
	end Pop;

	-- Implementação do algoritmo 3.4 
	procedure Avalia_Posfix(E : String; R : out Tipo) is
		P              : Pilha;   	-- Declara uma pilha 
		Estava_No_Topo : Tipo;		-- Armazena quem estava
						-- no topo de uma pilha 
		Op1            : Tipo;
		Op2            : Tipo;
	begin
		Inicializa(P);
		for I in E'Range loop
			if E(I) in '0'.. '9' then
				Push(P,Character'Pos(E(I)) - 
				       Character'Pos('0'));
			else
				Pop(P,Op1);
				Pop(P,Op2);
				case E(I) is
					when '+' => Push(P,Op1 + Op2);
					when '-' => Push(P,Op1 - Op2);
					when '*' => Push(P,Op1 * Op2);
					when '/' => Push(P,Op1 / Op2);
				end case;
			end if;
		end loop;
		Pop(P,R);
	end Avalia_Posfix;

end PilhaG;