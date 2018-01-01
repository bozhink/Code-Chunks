
with Calendar; use Calendar;
package New_Alert_System is

	Stop_System : Boolean := False;

	type Event is (Normal, Alert_On, Medium_Alert_On, High_Alert_On); 
	type Device is (Teletype, Console, Big_Screen);
	subtype Person is Character;
	subtype Message_Type is String(1..5);

	type Alert is tagged record
		Time_Of_Arrival : Calendar.Time;
		Message         : Message_Type;
		end record;

	Max_Alerts : constant := 3;
	Alert_Records : array(1 .. Max_Alerts) of Alert;
	No_Alerts : Natural := 0;

	procedure Display(A : in Alert; On : in Device);
	procedure Handle(A : in out Alert);
	procedure Log(A : in Alert);

	type Low_Alert is new Alert with null record;

	type Medium_Alert is new Alert with record
		Action_Officer : Person;
		end record;

	procedure Handle(MA : in out Medium_Alert);

	type High_Alert is new Medium_Alert with record
		Ring_Alarm_At : Calendar.time;
		end record;

	procedure Handle(HA : in out High_Alert);
	procedure Set_Alarm(HA : in High_Alert);

end New_Alert_System;


with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO; 
use  Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
package body New_Alert_System is

	package Enum_IO is new Enumeration_IO(Device); use Enum_IO;

	N_Voluntier : Integer range 0 .. 9 := 0;

	function Assign_Voluntier return Person is
		Voluntier : Person;
	begin
		N_Voluntier := N_Voluntier + 1;
		Voluntier   := Character'Val(N_Voluntier 
		               + Character'Pos('A'));
		return Voluntier;
	end Assign_Voluntier;

	procedure Handle(A : in out Alert) is
	begin
		delay 0.1;
		A.Time_Of_Arrival := Calendar.Clock;
		Log(A);
		Display(A, Teletype);
	end Handle;

	procedure Handle(MA : in out Medium_Alert) is
	begin
		Handle(Alert(MA));
		delay 0.1;
		MA.Time_Of_Arrival := Calendar.Clock;
		MA.Action_Officer := Assign_Voluntier;
		Put("Officer in charge: " & Ma.Action_Officer);
		Display(Alert(MA), Console);
	end Handle;

	procedure Handle(HA : in out High_Alert) is
	begin
		Handle(Medium_Alert(HA));
		delay 0.1;
		HA.Time_Of_Arrival := Calendar.Clock;
		Display(Alert(HA), Big_Screen);
		Set_Alarm(HA);
	end Handle;

	procedure Display(A : in Alert; On : in Device) is 
		Year    : Year_Number;
		Month   : Month_Number;
		Day     : Day_Number;
		Seconds : Day_Duration;
	begin
		Calendar.Split(A.Time_Of_Arrival,Year,Month,Day,Seconds);
		Put(Month,2);
		Put('-');
		Put(Day,2);
		Put('-');
		Put(Year,4);
		Put(' ');
		Put(Seconds,Aft => 0,Exp => 0);
		Put(" Message: " & A.Message & " Device: ");		
		Put(On);
		New_Line;
	end Display;

	procedure Log(A : in Alert) is 
	begin
		if No_Alerts = Max_Alerts then
			Put_Line("Activate full emergency procedure!");
			Put(AscII.Bel);
			Stop_System := True;
		else
			No_Alerts := No_Alerts + 1;
			Alert_Records(No_Alerts)  := A;
		end if;
	end Log;
	

	task Ring_Alarm is
		entry Start(M : Message_Type);
	end Ring_Alarm;

	task body Ring_Alarm is
		Msg : Message_Type;
	begin
		accept Start(M : Message_Type) do
			Msg := M;
		end start;
		loop
			Put(AscII.Bel);
			Delay(0.03);
			exit when Stop_System;
		end loop;
	end Ring_Alarm;

	procedure Set_Alarm(HA : in High_Alert) is 
	begin
		Ring_Alarm.Start(HA.Message);
	end Set_Alarm;

end New_Alert_System;


with New_Alert_System, Calendar, Ada.Numerics.Discrete_Random; 
use New_Alert_System;
with Ada.text_io; use Ada.text_io;
procedure OOP2 is
	package Random_Event is new Ada.Numerics.Discrete_Random(Event);
	use Random_Event;

	A : Alert;
	M : Medium_Alert;
	H : High_Alert;

	E : Event;
	G : Generator;
begin
	Reset(G);
	-- Run 1,000 times
	for N in 1 .. 1_000 loop
		exit when Stop_System;
		E := Random(G);
		case E is
			when Normal => 
				null;
			when Alert_On => -- Alert is on
				A.Message := "Alert";
				Handle(A);
			when Medium_Alert_On => -- Medium alert is on
				M.Message := "Mediu";
				Handle(M);
			when High_Alert_On => -- High alert is on
				H.Message := "High ";
				Handle(H);
		end case;
	end loop;
end OOP2;