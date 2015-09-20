library IEEE;
use IEEE.std_logic_1164.all;

entity fun is
  Port(A, B : in std_logic;
          Y : out std_logic);
end fun;

architecture FunGenerator of fun is
begin
  Y <= (A and (not B)) or ((not A) and B);
end;
