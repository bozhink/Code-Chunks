LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY acc_tb_vhd IS
END acc_tb_vhd;

ARCHITECTURE behavior OF acc_tb_vhd IS
-- Component Declaration for the Unit Under Test UUT)
  COMPONENT acc
    PORT(
           a : IN std_logic_vector(3 downto 0);
         clk : IN std_logic;
       reset : IN std_logic;
         sum : OUT std_logic_vector(5 downto 0)
        );
  END COMPONENT;
--Inputs
  SIGNAL clk : std_logic := '0';
  SIGNAL reset : std_logic := '0';
  SIGNAL a : std_logic_vector(3 downto 0) := (others=>'0');
--Outputs
  SIGNAL sum : std_logic_vector(5 downto 0);
BEGIN
-- Instantiate the Unit Under Test (UUT)
uut: acc PORT MAP(
                    a => a,
                  clk => clk,
                reset => reset,
                  sum => sum
                );

tb : PROCESS BEGIN
  reset <= '1';
  wait for 100 ns;
  reset <= '0';
  wait for 200 ns;
  a <= "0101";
  wait for 300 ns;
  a <= "0010";
  wait for 100 ns;
  wait; -- will wait forever
END PROCESS;
CLKGEN : process begin
  CLK <= not CLK;
  wait for 25 ns;
end process;
END;