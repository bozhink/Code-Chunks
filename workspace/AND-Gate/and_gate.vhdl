-- and_gate.vhdl created on 10:50  2012.4.5
-- import std_logic from IEEE library
library IEEE;
use IEEE.std_logic_1164.all;

-- this is the entity
entity ANDGATE is
	port (
		I1 : in std_logic;
		I2 : in std_logic;
		O  : out std_logic);
end entity ANDGATE;

-- this is architecture
architecture RTL of ANDGATE is
begin
	O <= I1 and I2;
end architecture RTL;
