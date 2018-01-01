-- (C) 1999, Arthur Vargas Lopes 
-- Arquivo fonte ETF.Ads

package Eval_ETF is

	Expressao_Invalida : exception;

	procedure Inicializa(S : String);
	function E return Integer;

end Eval_ETF;