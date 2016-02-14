-- mux.vhdl created on 11:25  2011.8.9
library ieee;
use ieee.std_logic_1164.all;

entity mux is
	port (a,b,c,d : in bit;
			s0,s1:in bit;
			x : out bit);
end mux;

architecture dataflow of mux is
	signal selectx : integer;
begin
	selectx <=	0 when s0='0' and s1='0' else
				1 when s0='1' and s1='0' else
				2 when s0='0' and s1='1' else
				3;
	x <=	a after 0.5 ns when select=0 else
	 		b after 0.5 ns when select=1 else
	 		c after 0.5 ns when select=2 else
	 		d after 0.5 ns;
end dataflow;

	