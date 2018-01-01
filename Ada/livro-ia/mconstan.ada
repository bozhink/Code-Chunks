pragma List(On);
-- Arquivo fonte MConstan.Ada
with Ada.Text_IO, Ada.Strings.Maps.Constants;
use  Ada.Text_IO, Ada.Strings.Maps, Ada.Strings.Maps.Constants;
procedure Constantes_Para_Mapeamento is

--	Control_Set           : constant Character_Set;
--	Graphic_Set           : constant Character_Set;
--	Letter_Set            : constant Character_Set;
--	Lower_Set             : constant Character_Set;
--	Upper_Set             : constant Character_Set;
--	Basic_Set             : constant Character_Set;
--	Decimal_Digit_Set     : constant Character_Set;
--	Hexadecimal_Digit_Set : constant Character_Set;
--	Alphanumeric_Set      : constant Character_Set;
--	Special_Set           : constant Character_Set;
--	ISO_646_Set           : constant Character_Set; -- Not AVLAda95
--	Lower_Case_Map        : constant Character_Mapping;
--	Upper_Case_Map        : constant Character_Mapping;
--	Basic_Map             : constant Character_Mapping;
begin
	Put_Line(To_Sequence(Decimal_Digit_Set));
end Constantes_Para_Mapeamento;	