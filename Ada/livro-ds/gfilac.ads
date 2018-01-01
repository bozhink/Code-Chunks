-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte GFila.Ads
generic
	-- Facilita ainda mais a troca to tipo da fila circular
	type Tipo_Da_Fila is private;
package FilaC is  -- Interface para clientes da fila circular

	-- Declara os subscritos da fila circular
	subtype Intervalo_Fila is Integer range 1 .. 10;

	-- Declara‡ao de um tipo array
	type Vetor_De_Elementos is array(Intervalo_Fila) of Tipo_Da_Fila;

	-- Declara o tipo Fila circular como protegido
	type Fila is private;

	-- Implementa‡ao do algor¡tmo 4.5
	procedure Queue(F : in out Fila; D : Tipo_Da_Fila);

	-- Implementa‡ao do algor¡tmo 4.6 
	procedure DeQueue(F : in out Fila; R : out Tipo_Da_Fila);

	function Tamanho(F : Fila) return Natural;

	Overflow_Na_Fila  : exception;
	Underflow_Na_Fila : exception;
private
	type Fila is record
		Q  : Vetor_De_Elementos;
		Inicio  : Integer := 1; -- Substitui procedimento de 
		Fim     : Integer := 0; -- inicializa‡ao (algorítmo 4.4)
		Tamanho : Integer := 0;
		end record;

end FilaC;
