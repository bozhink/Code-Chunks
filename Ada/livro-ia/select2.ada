-- Arquivo fonte Select2.Ada
with Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO
   , Ada.Numerics.Float_Random
   , Ada.Numerics.Discrete_Random
   , Ada.Calendar;
use  Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO
   , Ada.Calendar;
procedure Sistema_De_Monitoracao is
	
	M : array(1..3, 1..8) of Boolean 
		:= (others => (others => False));

	task Intrusos is
		entry Inicia;
	end Intrusos;

	task type Monitora(Linha : Positive);

	task Alarme is
		entry Ativa(Linha, Coluna : Positive);
	end Alarme;

	L1 : Monitora(1);
	L2 : Monitora(2);
	L3 : Monitora(3);
			
	task body Intrusos is
		subtype Local is Integer range 0 .. 23;	
		package DR is new 
			Ada.Numerics.Discrete_Random(Local);
		Gen_Intruso : DR.Generator;
		Gen_Tempo   : Ada.Numerics.Float_Random.Generator;
		Espera      : Duration;
		Intruso     : Local;
		Linha       : Positive;
		Coluna      : Positive;
	begin
		accept Inicia;
		DR.Reset(Gen_Intruso);
		Ada.Numerics.Float_Random.Reset(Gen_Tempo);
		loop	
			Espera := Ada.Numerics.Float_Random.Random(Gen_Tempo)
			          * 10.0;
			delay Espera;			
			Intruso := DR.Random(Gen_Intruso);
			Linha := Intruso / 8 + 1;
			Coluna := Intruso mod 8 + 1;
			M(Linha,Coluna) := True;
		end loop;
	end Intrusos;
			
	task body Monitora is
	begin
		loop
			for Coluna in M'Range(2) loop
				if M(Linha,Coluna) then
					Alarme.Ativa(Linha,Coluna);
					M(Linha,Coluna) := False;
				end if;
			end loop;
		end loop;
	end Monitora;
			
	task body Alarme is
		Ocorrencia   : Time;
		Dia          : Day_Number;
		Mes          : Month_Number;
		Ano          : Year_Number;
		Segundos     : Day_Duration;
	begin
		loop
			select
				accept Ativa(Linha, Coluna : Positive) do
					Put(ASCII.Bel);
					Ocorrencia := Clock;
					Split(Ocorrencia
					     ,Ano
					     ,Mes
					     ,Dia
					     ,Segundos);
					Put(Ano,4);
					Put('/');
					Put(Mes,1);
					Put('/');
					Put(Dia,1);
					Put('-');
					Put(Segundos,1,1,0);
					Put(" Intruso detectado: (");
					Put(Linha,1);
					Put(',');
					Put(Coluna,1);
					Put_Line(")");
				end Ativa;
			or
				delay 0.01;
			end select;
		end loop;
	end Alarme;
	
begin
	Put_Line("Monitor_Ligado!");
	Intrusos.Inicia;
	delay 5.0; -- Desliga tudo depois de 5 segundos
	abort Intrusos;
	abort L1;
	abort L2;
	abort L3;
	abort Alarme;	
end Sistema_De_Monitoracao;