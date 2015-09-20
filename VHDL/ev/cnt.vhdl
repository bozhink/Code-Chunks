library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity cnt is
  port(clk : in std_logic;
        q1 : out std_logic_vector(3 downto 0);
        q2 : out std_logic_vector(3 downto 0));
end cnt;

architecture bh of cnt is
begin
  process(clk)
    variable tmp : std_logic_vector(3 downto 0) := "0000";
  begin
    if rising_edge(clk) then
      tmp:=tmp+1;
    end if;
    q1 <= tmp;
  end process;
  
  process
    variable tmp : std_logic_vector(3 downto 0) := "0000";
  begin
    wait until clk = '1';
    tmp := tmp + 1;
    q2 <= tmp;
  end process;
end bh;
