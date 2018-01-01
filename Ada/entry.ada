-- (C) 1994-1996 Arthur Vargas Lopes
with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
procedure Protected_Entry_Barrier is

	subtype DB_Range is Integer range 1 .. 4;
	type DataBase is array(DB_Range) of Float;

	Records : DataBase := (others => 0.0);

	protected Semaphore is
		entry Wait;
		procedure Signal;
	private
		Ready         : Boolean := False;
	end Semaphore;

	protected body Semaphore is

		entry Wait when not Ready is
		begin
			Ready := True;
		end Wait;

		procedure Signal is
		begin
			Ready := False;
		end Signal;

	end Semaphore;

	protected Control is
		entry Wait_For_Two_Users;
		procedure Done;
	private
		Still_Running : Integer := 3;
	end Control;

	protected body Control is

		entry Wait_For_Two_Users when Still_Running = 0 is
		begin
			null;
		end Wait_For_Two_Users;

		procedure Done is
		begin
			Still_Running := Still_Running - 1;
		end Done;

	end Control;

	task type User(Account : Integer);
	
	User_A : User(1);
	User_B : User(2);
	User_C : User(4);

	task body User is
	begin
		-- Make a deposit
		Semaphore.Wait;
		Records(Account) := Records(Account) + 10.0;
		Semaphore.Signal;
		-- Make a withdraw
		Semaphore.Wait;
		Records(Account) := Records(Account) - 5.0;
		Semaphore.Signal;
		Control.Done;
	end User;

begin
	Control.Wait_For_Two_Users;
	for I in DB_Range loop
		Put("User ");
		Put(I);
		Put(" ending balance: ");
		Put(Records(I),5,2);
		New_Line;
	end loop;
end Protected_Entry_Barrier;