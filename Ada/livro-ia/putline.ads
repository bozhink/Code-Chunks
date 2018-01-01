-- Arquivo fonte Put_Line.Ads
package Novo_Put_Line is

	procedure Put_Line(Item    : Character; 
	                   Spacing : Positive := 1);

	procedure Put_Line(Item    : String; 
	                   Spacing : Positive := 1);

end Novo_Put_Line;