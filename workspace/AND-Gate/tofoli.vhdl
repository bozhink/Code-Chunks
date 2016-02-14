library IEEE;
use IEEE.std_logic_1164.all;

-- this is the entity
entity TOFOLI is
	port (
		I1 : in std_logic;
		I2 : in std_logic;
		I3 : in std_logic;
		O1 : out std_logic;
		O2 : out std_logic;
		O3 : out std_logic);
end entity TOFOLI;

architecture TofoliGate of TOFOLI is
begin
	O1 <= I1;
	O2 <= I2;
	O3 <= I3 xor (I1 and I2);
end architecture TofoliGate;