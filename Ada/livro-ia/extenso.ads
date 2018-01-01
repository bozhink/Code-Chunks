-- Arquivo fonte Extenso.Ads
package Extenso is

	subtype Valor_Editado is String(1..10);
	
	procedure Edita_Valor(V : Float; R : out Valor_Editado);

	function Valor_Por_Extenso (V : Float) return String;

end Extenso;