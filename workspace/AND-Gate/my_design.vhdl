library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity my_design is
     Port ( input : in  STD_LOGIC_VECTOR (31 downto 0);
            output : out  STD_LOGIC_VECTOR (7 downto 0));
end my_design;

architecture Behavioral of my_design is

begin

 output <= input(31 downto 24) and input(23 downto 16) 
         and input(15 downto 8) and input(7 downto 0);

end Behavioral;