library ieee;
using ieee.std_logic_1164.all;
using ieee.std_logic_arith.all;
using ieee.std_fixed_pkg.all;

entity exp_cal is 
    port{
        int_a : in integer range 0 to 262140;
        floadt_sigema : in sfixed (3 downto -16);
        float_b : out sfixed (3 downto -16);