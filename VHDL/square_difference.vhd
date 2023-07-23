library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
library ieee_proposed;
use ieee.std_proposed.fixed_pkg.all;

entity square_difference is 
    port(
        sv : in sfixed (3 downto -14);
        testdata : in sfixed (3 downto -14);
        res : out sfixed (7 downto -10));
end square_difference;

architecture behav of square_difference is
    
    signal diff : sfixed (3 downto -10);
    
begin
    
    diff <= sv - testdata;
    res <= diff * diff;

end behav;