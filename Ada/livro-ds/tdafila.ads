-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte TDAFila.Ads
package Fila_Char is  -- Interface para clientes da Fila

	-- Facilita a troca to tipo da Fila
	subtype Tipo_Da_Fila is Character;

	-- Declara os subscritos da Fila
	subtype Intervalo_Fila is Integer range 1 .. 10;

	-- Declaração de um tipo array
	type Vetor_De_Elementos is array(Intervalo_Fila) of Tipo_Da_Fila;

	-- Declara o tipo Fila como protegido
	type Fila is private;

	-- Implementação do algorítmo 4.2
	procedure Queue(F : in out Fila; D : Tipo_Da_Fila);

	-- Implementação do algorítmo 4.3 
	procedure DeQueue(F : in out Fila; R : out Tipo_Da_Fila);

	function Tamanho(F : Fila) return Natural;

private
	type Fila is record
		Q  : Vetor_De_Elementos;
		Inicio : Integer := 1; -- Substitui procedimento de 
		Fim    : Integer := 0; -- inicialização (algorítmo 4.1)
		end record;

end Fila_Char;
