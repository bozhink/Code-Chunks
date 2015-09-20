-- decoder.vhdl created on 1:58  2009.7.12

library IEEE;
use IEEE.std_logic_1164.all;

entity DECODER is
  Port( A, B : in std_logic;
        Y0, Y1, Y2, Y3 : out std_logic);
end DECODER;

architecture STRUCTURE of DECODER is
begin
  Y0 <= ((not A) and (not B)) or (A and (not B)) or (A and B);
  Y1 <= ((not A) and (not B)) or (A and (not B)) or (A and B);
  Y2 <= ((not A) and (not B)) or (B and (not A)) or (A and B);
  Y3 <= ((not A) and (not B)) or (A and (not B)) or ((not A) and B);
end STRUCTURE;
