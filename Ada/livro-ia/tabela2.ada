-- Arquivo fonte Tabela2.Ada
with Ada.Text_IO, Ada.Integer_Text_IO;
with Menu_Auxiliar, Tabela_Para_Inteiros_2;
use  Ada.Text_IO, Ada.Integer_Text_IO;
use  Menu_Auxiliar, Tabela_Para_Inteiros_2;
procedure Testa_Tabela_Para_Inteiros_2 is
	T1     : Tabela;
	Opcao  : String(1..3);
	N      : Integer;
	Val    : Tipo;
	Indice : Intervalo;

	procedure Insere_Valor is
	begin
		Put("Entre um valor para inserir: ");
		Get(Val);
		Insere(T1,Val);
	exception
		when Tabela_Cheia =>
			Put(ASCII.Bel);
			Mensagem("Nao pode inserir: a tabela" &
			         " esta completa");
	end Insere_Valor;

	procedure Retira_Elemento is
	begin
		Put("Entre o indice do elemento" &
		    " para ser retirado: ");
		Get(Indice);
		Retira(T1,Indice);
	exception
		when Tabela_Vazia =>
			Put(ASCII.Bel);
			Mensagem("Nao pode retirar: a tabela" &
		        	 " esta vazia");
	end Retira_Elemento;
begin
	Inicia(T1);
	
	loop 
		Exibe_Titulo("Opcoes para teste da " &
		             "tabela para inteiros:");
		Put_Line("    1  <===>  Insere");
		Put_Line("    2  <===>  Retira");
		Put_Line("    3  <===>  Consulta");
		Put_Line("    4  <===>  Exibe Tabela");
		Put_Line("    9  <===>  Termina");
		New_Line;
		Put("Selecione uma opcao: ");
		Get_Line(Opcao,N);
		case Opcao(1) is
			when '1' => 
				Insere_Valor;	
			when '2' => 
				Retira_Elemento;
			when '3' => 
				Put("Entre o valor para consulta: ");
				Get(Val);
				Put_Line("O valor " &
				         Integer'Image(Val) &
				         " ocupa o indice " &
					 Integer'Image
					 (Pesquisa(T1,Val)));
				Mensagem("");
			when '4' =>
				Exibe_Titulo("Indice  Valor");
				for I in 1 .. Quantos(T1) loop
					Put(I,4);
					Put(Valor(T1,I),9);
					New_Line;
				end loop;
				Mensagem("");
			when '9' =>
				exit;
			when others =>
				Put(ASCII.Bel);
		end case;
	end loop;
end Testa_Tabela_Para_Inteiros_2;