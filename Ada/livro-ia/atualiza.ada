-- Arquivo fonte Atualiza.Ada
with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
procedure Estoque is

	subtype Tipo_Nome is String(1..20);

	-- Item de estoque 
	type Item_Estoque is record
		Codigo		: Positive;
		Quantidade	: Natural;
		Valor_Unitario	: Float;
		Nome		: Tipo_Nome;
		end record;

	type Tabela is array(1 .. 20) of Item_Estoque;

	-- O estoque, durante a execução do programa,
	-- é composto por 20 itens e um indicador
	-- da quantidade lógica de itens
	type Estoque is record
		Itens   : Tabela;
		Quantos : Natural;
		end record;

	-- Lê item de estoque para memória
	procedure Get(Arquivo  : in File_Type; 
	              Item     : out Item_Estoque) is

		Quantos_Bytes : Positive range 1 .. 20;
	begin
		Get(Arquivo,Item.Codigo,6);
		Get(Arquivo,Item.Quantidade,4);
		Get(Arquivo,Item.Valor_Unitario,9);
		Get_Line(Arquivo,Item.Nome,Quantos_Bytes);
		for I in Quantos_Bytes+1..Tipo_Nome'Last loop
			Item.Nome(I) := ' ';
		end loop;
	end Get;

	-- Grava item de estoque em disco
	procedure Put(Arquivo : in File_Type;
	              Item    : in Item_Estoque) is
	begin
		Put(Arquivo,Item.Codigo,6);
		Put(Arquivo,Item.Quantidade,4);
		Put(Arquivo,Item.Valor_Unitario,6,2,0);
		Put_Line(Arquivo,Item.Nome);
	end Put;

	-- Inicia o processamento do programa;
	-- Primeiro tenta abrir o arquivo de estoque. 
	-- Se o arquivo não existe este é criado. 
	-- Caso contrário transfere seu conteúdo
	-- para a área de trabalho.
	procedure Inicia(Nome : in String;
			 Tab  : out Estoque) is
		Arq  : File_Type; 	
	begin
		Open(Arq,In_File,Nome);
		Get(Arq,Tab.Quantos,4);
		for I in 1 .. Tab.Quantos loop
			Get(Arq,Tab.Itens(I));				
		end loop;
		Close(arq);

	exception -- Interceptação de exceptions

		-- Name_Error é ativada quando 
		-- Open não abre arquivo
		when Name_Error => 
			Tab.Quantos := 0;
			-- Cria novo arquivo
			Create(Arq,Out_File,Nome);
			Put(Arq,Tab.Quantos,4);
			Close(Arq);

		-- As outras exceptions são
		-- propagadas para fora de Atualiza
	end Inicia;

	-- Este sub-programa gerencia a atualização
	-- do estoque.
	procedure Atualiza(Tab  : in out Estoque) is

		Arq   : File_Type; 	
		Opcao : String(1..10);
		N     : Integer;

		-- Exibe mensagem na tela e espera
		-- pelo usuário
		procedure Mensagem(Msg : String) is
		begin
			Put(ASCII.Bel);
			if Msg'First < Msg'Last then
				Put_Line(Msg);
			end if;
			Put("Pressione qualquer tecla " & 
			    "e ENTER para continuar ... ");
			Get_Line(Opcao,N);

		end Mensagem;

		-- Cadastra novo item de estoque
		procedure Cadastra is
			Quantos_Bytes : Positive;
			Item          : Item_Estoque;
		begin
			if Tab.Quantos = Tabela'Last then
				Mensagem("Estoque cheio. " &
					 "Nao pode cadastrar.");
			else
				New_Line(24);
				Put_Line("Cadastrando novo item");
				Put_Line("---------------------");
				New_Line;
				Put("Codigo        : ");
				Ada.Integer_Text_IO.Get(Item.Codigo);
				Put("Nome do Item  : ");
				Get_Line(Item.Nome,Quantos_Bytes);
				-- Limpa o resto do nome
				for I in Quantos_Bytes+1..Tipo_Nome'Last loop
					Item.Nome(I) := ' ';
				end loop;
				Put("Quantidade    : ");
				Get(Item.Quantidade);
				Put("Valor unitario: ");
				Get(Item.Valor_Unitario);
				Tab.Quantos := Tab.Quantos + 1;
				Tab.Itens(Tab.Quantos) := Item;
			end if;
		end Cadastra;

		-- Consulta item de estoque
		procedure Consulta is
		begin
			null; -- Completar
		end Consulta;

		-- Exclui item do estoque
		procedure Exclui is
		begin
			null; -- Completar
		end Exclui;

		-- Mostra na tela os itens em estoque
		procedure Exibe is
			Avanca : Positive;
		begin
			New_Line(24);
			Put("Codigo Item                 ");
			Put("Quantidade V. Unitario");
			New_Line(2);
			for I in 1 .. Tab.Quantos loop
				Put(Tab.Itens(I).Codigo,6);
				Put(" " & Tab.Itens(I).Nome);
				Put(Tab.Itens(I).Quantidade,11);
				Put(Tab.Itens(I).Valor_Unitario
				                      ,9,2,0);
				New_Line;
			end loop;
			if Tab.Quantos < 20 then
				Avanca := 20 - Tab.Quantos;
				New_Line(Avanca);
			end if;
			Mensagem("");
		end Exibe;

		-- Saída de item de estoque
		-- reduz a quantidade
		procedure Saida is
		begin
			null; -- Completar
		end Saida;

		-- Entrada de item de estoque
		-- aumenta a quantidade
		procedure Entrada is
		begin
			null; -- Completar
		end Entrada;

	begin -- Seqüência de comandos interceptáveis
	      -- do sub-programa Atualiza

		loop	-- Exibe menu de opções

			-- Limpa a tela
			Ada.Text_IO.New_Line(23); 
			
			-- Exibe menu de opções
			Put_Line("Sistema de Estoque");
			Put_Line("==================");
			New_Line;
			Put_Line("1 ==> Cadastra");
			Put_Line("2 ==> Consulta");
			Put_Line("3 ==> Exclui");
			Put_Line("4 ==> Exibe Estoque");
			Put_Line("5 ==> Saida");
			Put_Line("6 ==> Entrada");
			Put_Line("9 ==> Termina");
			New_Line;
			Put("Tecle o numero da opcao desejada" &
			    " e precione ENTER ==> ");
			Get_Line(Opcao,N);
		
			-- Identifica a opção do usuário

			case Opcao(1) is
				when '1' => Cadastra;

				when '2' => Consulta;

				when '3' => Exclui;

				when '4' => Exibe;

				when '5' => Saida;

				when '6' => Entrada;

				when '9' => exit;

				-- Opcao ilegal
				when others => Put(ASCII.BEL);
			end case;
		end loop;	
	
		New_Line;
	end Atualiza;

	-- Transfere o estoque da memória para disco
	procedure Conclui(Nome : in String;
			  Tab  : in Estoque) is
		Arq  : File_Type; 	
	begin
		Create(Arq,Out_File,Nome);
		Ada.Integer_Text_IO.Put(Arq,Tab.Quantos,4);
		for I in 1 .. Tab.Quantos loop
			Put(Arq,Tab.Itens(I));
		end loop;
		Close(arq);
	end Conclui;

	Arq_Nome        : constant String(1..12) := "Atualiza.Dat";
	Tabela_De_Itens : Estoque;
begin
	Inicia(Arq_Nome,Tabela_De_Itens);
	Atualiza(Tabela_De_Itens);
	Conclui(Arq_Nome,Tabela_De_Itens);
end Estoque;
