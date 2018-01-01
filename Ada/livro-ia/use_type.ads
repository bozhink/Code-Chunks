-- Arquivo fonte Use_Type.Ads
package Matrizes is

	type Matriz is array(Integer range <>
	                    ,Integer range <>)
	            of Float;

	procedure Le_Matriz(M : out Matriz);

	function Soma(M : Matriz; Linha : Integer) return Float;
	function Soma(M : Matriz) return Float;

end Matrizes;