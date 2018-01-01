-- Arquivo fonte Tagged.Ada
package Carros is
	type Carro is tagged record
		Modelo : String(1..8);
		Preco  : Float;
		end record;

	type Carro_Automatico is new Carro with record
		Auto_Preco : Float;
		end record;

	type Carro_Conversivel is new Carro_Automatico with record
		Conv_Preco : Float;
		end record;
	procedure Exibe_Carro(C : Carro);
	procedure Exibe_Automatico(A : Carro_Automatico);
	procedure Exibe_Conversivel(C : Carro_Conversivel);
end Carros;

with Ada.Text_IO, Ada.Float_Text_IO; 
use  Ada.Text_IO, Ada.Float_Text_IO; 
package body Carros is
	procedure Exibe_Carro(C : Carro) is
	begin
		Put("Modelo: " & C.Modelo & " Preco basico: ");
		Put(C.Preco,4,2,0);
		New_Line;
	end Exibe_Carro;

	procedure Exibe_Automatico(A : Carro_Automatico) is
	begin
		Exibe_Carro(Carro(A));
		Put("Preco com automatico: ");
		Put(A.Preco + A.Auto_Preco,4,2,0);
		New_Line;
	end Exibe_Automatico;

	procedure Exibe_Conversivel(C : Carro_Conversivel) is
	begin
		Exibe_Automatico(Carro_Automatico(C));
		Put("Preco do conversivel: ");
		Put(C.Preco + C.Auto_Preco + C.Conv_Preco,4,2,0);
		New_Line;
	end Exibe_Conversivel;
end Carros;

with Carros; use Carros;
procedure Testa_Tagged is
	Padrao      : Carro := ("Brasil  ",6000.00);
	Automatico  : Carro_Automatico := ("Brasil A",6000.00,800.00);
	Conversivel : Carro_Conversivel := ("Brasil C",6000.00,800.00,2100.00);
begin
	Exibe_Carro(Padrao);
	Exibe_Automatico(Automatico);
	Exibe_Conversivel(Conversivel);
end Testa_Tagged;	