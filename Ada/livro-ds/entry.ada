-- (C) 1994-1999, Arthur Vargas Lopes
-- Arquivo fonte Entry.Ada
with Ada.Text_IO, Ada.Integer_Text_IO
                , Ada.Float_Text_IO
                , Ada.Numerics.Float_Random;
use  Ada.Text_IO, Ada.Integer_Text_IO
                , Ada.Float_Text_IO
                , Ada.Numerics.Float_Random;
procedure Entry_Barrier is

	subtype DB_Range is Integer range 1 .. 4;
	type DataBase is array(DB_Range) of Float;

	Records : DataBase := (others => 0.0);

	G : Generator;		

	protected Semaphore is
		entry Wait;
		procedure Signal;
	private
		Open : Boolean := True;
	end Semaphore;

	protected body Semaphore is

		entry Wait when Open is
		begin
			Open := False;
		end Wait;

		procedure Signal is
		begin
			Open := True;
		end Signal;

	end Semaphore;

	protected Control is
		entry Wait_For_Users;
		procedure Done;
	private
		Still_Running : Integer := 4;
	end Control;

	protected body Control is

		entry Wait_For_Users when Still_Running = 0 is
		begin
			null;
		end Wait_For_Users;

		procedure Done is
		begin
			Still_Running := Still_Running - 1;
		end Done;

	end Control;

	task type User(Account : Integer);
	
	User_A : User(1);
	User_B : User(2);
	User_C : User(4);
	User_D : User(3);

	task body User is
	begin
		-- Fa‡a um dep¢sito
		Semaphore.Wait;
		Records(Account) := Records(Account) + 10.0 * Random(G);
		Semaphore.Signal;

		-- Fa‡a uma retirada
		Semaphore.Wait;
		Records(Account) := Records(Account) - 5.0 * Random(G);
		Semaphore.Signal;

		-- Avise o seu t‚rmino
		Control.Done;
	end User;

begin
	Control.Wait_For_Users;
	for I in DB_Range loop
		Put("Usuario ");
		Put(I);
		Put(" Saldo Final: ");
		Put(Records(I),4,2);
		New_Line;
	end loop;
end Entry_Barrier;