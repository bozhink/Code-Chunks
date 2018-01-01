-- Arquivo fonte CaraCoro.Adb
with Ada.Numerics.Discrete_Random;
with Ada.Calendar; use Ada.Calendar;
package body Cara_Coroa is
	package Evento_Randomico is new 
		Ada.Numerics.Discrete_Random(Faces_Da_Moeda);
	use Evento_Randomico;

	Avanca : Faces_Da_Moeda;	
	Tempo : Time;
	Segundos : Float;
	G     : Generator;

	function Atira_Moeda return Faces_Da_Moeda is
	begin
		return Random(G);
	end Atira_Moeda;

begin
	Reset(G);
	Tempo := Clock;
	Segundos := Float(Seconds(Tempo) / 100.0);
	for I in 1..(Integer(Segundos) / 5) loop
		Avanca := Random(G);		
	end loop;
end Cara_Coroa;