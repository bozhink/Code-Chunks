-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte Floresta.Ada

with Ada.Text_IO, Ada.Integer_Text_IO, Floresta_Str;
use  Ada.Text_IO, Ada.Integer_Text_IO;
procedure Arvore_De_Busca_Em_Disco is

	package AB is new Floresta_Str(14);
	use AB;

	Header : Floresta;
	K      : Integer;
begin
	
	Inicializa("ADISCO.DAT",Header);

	Insere(Header,"Fulano de Tal",1010);
	Insere(Header,"Fulana de Tal",1020);
	Insere(Header,"Ciclano de Tal",1030);
	Insere(Header,"Beltrano",1040);
	Insere(Header,"Pertrano",1050);

	Imprime(Header);

	Fecha(Header);

	Abre("ADISCO.DAT",Header);

	K := Consulta(Header,"Ciclano de Tal");
	if K > 0 then
		Put("Ciclano de Tal tem tag ");
		Put(K,4);
		New_Line;
	else
		Put_Line("Nao encontrou Ciclano de Tal");
	end if;

	begin
		Remove(Header,"Ciclano de Tal");
		Put_Line("Ciclano de Tal foi removido");
	exception

		when others =>
			Put_Line("Nao removeu Ciclano de Tal");
	end;

	K := Consulta(Header,"Ciclano de Tal");
	if K > 0 then
		Put("Ciclano de Tal tem tag ");
		Put(K,4);
		New_Line;
	else
		Put_Line("Nao encontrou Ciclano de Tal");
	end if;

	Fecha(Header);

	Squash("ADISCO.DAT");

	Abre("ADISCO.DAT",Header);

	Imprime(Header);

	Fecha(Header);

end Arvore_De_Busca_Em_Disco;
