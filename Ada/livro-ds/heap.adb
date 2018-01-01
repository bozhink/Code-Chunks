-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte Heap.Adb        

with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
package body Heap is

	-- Utilizada para permitir a chamada Put para valores
	-- com tipo Integer e Float
	procedure Put(Item  : Float; 
	              Width : Positive; 
	              Dec   : Natural := 2) is
	begin
		Ada.Float_Text_IO.Put(Item,Width,Dec,0);
	end Put;

	-- Algoritmo 7.5 
	procedure Inicializa(H : in out Heap) is
	begin
		H.Q    := 0;
		H.V(0) := MValor;

	end Inicializa;

	-- Algoritmo 7.6 
	procedure Insere(H : in out Heap; Va : Tipo_Dado) is
		I : Integer;
	begin
		if H.Q = N then
			raise Heap_Overflow;
		end if;
		H.Q      := H.Q + 1;
		H.V(H.Q) := Va;
		I        := H.Q;
		while H.V(I / 2) <= Va loop
			H.V(I) := H.V(I / 2);
			I      := I / 2;
		end loop;
		H.V(I) := Va;

	end Insere;

	-- Algoritmo 7.7 
	procedure Remove(H : in out Heap; R : out Tipo_Dado) is
		J, K : Integer;
		Va   : Tipo_Dado;
	begin
		if H.Q = 0 then
			raise Heap_Underflow;
		end if;
		R      := H.V(1);
		H.V(1) := H.V(H.Q);
		H.Q    := H.Q - 1;
		Va     := H.V(1);
		K      := 1;
		while (K <= (H.Q / 2)) loop
			J := K + K;
			if J < H.Q and then H.V(J) < H.V(J+1) then
				J := J + 1;
			end if;
			exit when Va >= H.V(J);
			H.V(K) := H.V(J);
			K      := J;
		end loop;
		H.V(K) := Va;
	end Remove;

	-- Algoritmo 7.8 
	procedure Imprime(H : Heap; Msg : String) is
		I, J  : Integer;
		Nivel : Integer;

	begin
		Put_Line(Msg);
		Nivel := 1;
		Put(H.V(1), 39);
		New_Line;
		I     := Nivel + 1;
		while I <= H.Q loop
			J := 1;
			while (J <= Nivel * 2) and (I <= H.Q) loop
				Put(H.V(I), 80 / (Nivel * 2 + 1));
				I := I + 1;
				J := J + 1;
			end loop;
			New_Line;
			Nivel := Nivel + 1;
		end loop;
	end Imprime;

end Heap;