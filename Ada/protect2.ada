-- (C) 1999, Arthur vargas Lopes
-- Arquivo fonte protect2.ada
with Ada.Text_IO; use Ada.Text_IO;
procedure Demo_Monitor is

	subtype Vezes is Integer range 1 .. 3;

	protected Monitor is
		procedure Exibe(O_Que: Character);
		function  Le return Integer;
		procedure Grava;
	private
		Val    : Integer := 0;
		Ax, Bx : Integer := 0;
	end Monitor; 

	protected body Monitor is
		procedure Exibe(O_Que: Character) is
		begin
			Put(O_Que);
		end Exibe;

		function Le return Integer is
		begin
			return Val;
		end Le;

		procedure Grava is
		begin
			Ax  := Ax + 1;
			Bx  := Bx + 100;
			Val := Val + Ax + Bx;
		end Grava;
	end Monitor;

	task type Ler is
		entry Fim;
	end Ler;

	L1, L2 : Ler;

	task body Ler is
	begin
		for I in Vezes loop
			Put_Line(Integer'Image(Monitor.Le));
			Grava;
		end loop;
		accept Fim;
	end Ler;

	task type Exibe_Letra is
		entry Inicia(Letra:Character);
		Entry Fim;
	end Exibe_Letra;

	Ea: Exibe_Letra;
	Eb: Exibe_Letra;

	task body Exibe_Letra is
		Xqletra: Character;
	begin
		accept Inicia(Letra : Character) do
			Xqletra := Letra;
		end Inicia;
		for I in Vezes loop
			Monitor.Exibe(Xqletra);
		end loop;
		accept Fim;
	end Exibe_Letra;
begin
	Ler.Fim;
	Ea.Inicia('A');
	Eb.Inicia('B');
	Ea.Fim;
	Eb.Fim;
	New_Line;
	Put("FIM");	
	Put_Line(Integer'Image(Monitor.Le));
end Demo_Monitor;