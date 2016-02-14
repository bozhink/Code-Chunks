-- wrapper.vhdl created on 11:11  2012.4.5
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity wrapper is
     Port ( Clk : in  STD_LOGIC;
               push : in STD_LOGIC;
            input : in  STD_LOGIC_VECTOR (7 downto 0);
            output : out  STD_LOGIC_VECTOR (7 downto 0));
end wrapper;

architecture Behavioral of wrapper is

component my_design
port(   input : in  STD_LOGIC_VECTOR (31 downto 0);
       output : out  STD_LOGIC_VECTOR (7 downto 0));
end component;      

--state machine type
type stype is (idle,get_byte,delay);
signal s : stype := idle;
signal c1,c2 : integer := 0;
signal temp_reg : std_logic_vector(31 downto 0) := (others => '0');
         
begin

 uut : my_design port map
         (input => temp_reg, --concatenated signal
         output => output    );

process(Clk)
begin
     if(rising_edge(clk)) then
         case s is 
             when idle =>
                 if(push = '1') then
                     s <= get_byte;
                     c1 <= c1+1;
                 end if;
             when get_byte =>
                 temp_reg( (8*c1-1) downto (8*(c1-1)) ) <= input;
                 s <= delay;
             when delay => --delay for a time gap.
             --this delay is required to avoid the same byte getting 
             --registered into temp_reg for a single push button click.
                 c2 <= c2+ 1;
                 if(c2=25000000) then --for a 50 mhz clock, this generates a 0.5 sec delay.
                     c2 <= 0;
                     s <= idle;
                     if(c1=4) then
                         c1 <= 0;
                     end if;
                 end if;
         end case;
     end if;
end process;

end Behavioral;