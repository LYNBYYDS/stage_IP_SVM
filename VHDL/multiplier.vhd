library ieee;
using ieee.std_logic_1164.all;
using ieee.std_logic_arith.all;
using ieee.std_fixed_pkg.all;

entity multiplier is 
    port{
        float_a : in sfixed (3 downto -16)};
        float_b : in sfixed (3 downto -16);
        float_out : out sfixed (6 downto -16)};
end multiplier;

architecture behav of multiplier is
    
begin
    float_out <= float_a * float_b;
end behav;