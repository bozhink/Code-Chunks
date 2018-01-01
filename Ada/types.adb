-- common examples

with Ada.Text_IO; use Ada.Text_IO;

type Day_type   is range    1..  31;
type Month_type is range    1..  13;
type Year_type  is range 1800..2100;
type Weekday is (Monday, Tuesday, Wednwsday, Thursday, Friday, Saturday, Sunday);

type Date is
   record
      Day   : Day_type;
	  Month : Month_type;
	  Year  : Year_type;
   end record;

subtype Wroking_Hours is Hours range 0..12;
subtype Working_Day is Weekday range Monday..Friday;

Work_Load: costant array(Working_Day) of Working_Hours
   := (Friday => 6, Monday => 4, others => 10);

procedure x5 is begin

end x5;