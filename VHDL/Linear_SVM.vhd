library ieee;
using ieee.std_logic_1164.all;
using ieee.std_logic_arith.all;
using ieee.std_fixed_pkg.all;

entity exp_cal is 
    port{
        float_in : in sfixed (3 downto -16)};
        float_sigema : in sfixed (3 downto -16);
        float_out : out sfixed (3 downto -16)};
end exp_cal;

architecture behav of exp_cal is
    signal int_a_sig : integer range 0 to 262140;
    signal float_sigema_sig : sfixed (3 downto -16);
    signal float_b_sig : sfixed (3 downto -16);
    
begin
    int_a_sig <= int_a;
    float_sigema_sig <= float_sigema;
    float_b_sig <= float(int_a_sig) * float_sigema_sig;
    float_b <= float_b_sig;
end behav;