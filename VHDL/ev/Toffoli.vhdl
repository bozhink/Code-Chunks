-- Toffoli.vhdl created on 10:9  2009.7.18

library IEEE;
use IEEE.std_logic_1164.all;

entity Toffoli_XOR_gate is
port ( in1 : in std_logic;
       in2 : in std_logic;
       q1 : out std_logic;
       q2 : out std_logic );
end Toffoli_XOR_gate;

architecture STRUCTURE of Toffoli_XOR_gate is
begin
  process (in1, in2)
  begin
    if in1="0" then
      if in2="0" then
        q1 <= 0;
        q2 <= 0;
      elsif in2="1" then
        q1 <= "0";
        q2 <= "1";
      end if;
    elsif in1="1" then
      if in2="0" then
        q1 <= 1;
        q2 <= 1;
      elsif in2="1" then
        q1 <= "1";
        q2 <= "0";
      end if;
    end if;
  end process;
end STRUCTURE;
