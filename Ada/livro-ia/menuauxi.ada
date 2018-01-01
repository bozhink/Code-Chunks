-- Arquivo fonte Menu_Auxi.Ada
package Menu_Auxiliar is

	procedure Mensagem(Msg : String);
	procedure Exibe_Titulo(Titulo : String);

end Menu_Auxiliar;

with Ada.Text_IO;
package body Menu_Auxiliar is

	-- Exibe mensagem na tela e espera pelo usuário
	procedure Mensagem(Msg : String) is
		Opcao : String(1..3);
		N     : Integer;
	begin
		Ada.Text_IO.Put(ASCII.Bel);
		if Msg'First < Msg'Last then
			Ada.Text_IO.Put_Line(Msg);
		end if;
		Ada.Text_IO.Put("Precione qualquer tecla " & 
		    "e ENTER para continuar ... ");
		Ada.Text_IO.Get_Line(Opcao,N);
	end Mensagem;

	-- Exibe título e sublinha	
	procedure Exibe_Titulo(Titulo : String) is
	begin
		Ada.Text_IO.New_Line(23); 
		
		Ada.Text_IO.Put_Line(Titulo);
		for I in Titulo'Range loop
			Ada.Text_IO.Put('=');
		end loop;
		Ada.Text_IO.New_Line;
	end Exibe_Titulo;
end Menu_Auxiliar;
