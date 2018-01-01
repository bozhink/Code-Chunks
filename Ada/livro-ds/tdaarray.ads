-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte TDAArray.Ads
package Arrays is
	type Vetor_Integer is array(Integer range <>) of Integer;
	type Vetor_Float is array(Integer range <>) of Integer;
	type Matriz_Integer is array(Integer range <>
	                            ,Integer range <>) of Integer;
	type Matriz_Float is array(Integer range <>
	                          ,Integer range <>) of Float;
	function "+"(V1, V2 : Vetor_Integer) return Vetor_Integer;	
	function "-"(V1, V2 : Vetor_Integer) return Vetor_Integer;	
	function "*"(V1, V2 : Vetor_Integer) return Vetor_Integer;	
	function "/"(V1, V2 : Vetor_Integer) return Vetor_Integer;	

	function "+"(V1, V2 : Vetor_Float) return Vetor_Float;	
	function "-"(V1, V2 : Vetor_Float) return Vetor_Float;	
	function "*"(V1, V2 : Vetor_Float) return Vetor_Float;	
	function "/"(V1, V2 : Vetor_Float) return Vetor_Float;	
	
	function "+"(M1, M2 : Matriz_Integer) return Matriz_Integer;	
	function "-"(M1, M2 : Matriz_Integer) return Matriz_Integer;	
	function "*"(M1, M2 : Matriz_Integer) return Matriz_Integer;	
	function "/"(M1, M2 : Matriz_Integer) return Matriz_Integer;	

	function "+"(M1, M2 : Matriz_Float) return Matriz_Float;	
	function "-"(M1, M2 : Matriz_Float) return Matriz_Float;	
	function "*"(M1, M2 : Matriz_Float) return Matriz_Float;	
	function "/"(M1, M2 : Matriz_Float) return Vetor_Float;	

	Vetores_Nao_Conformados  : exception;
	Matrizes_Nao_Conformadas : exception;
end Arrays;	