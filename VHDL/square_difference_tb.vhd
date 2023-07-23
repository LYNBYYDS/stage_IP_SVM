library ieee;
using ieee.std_logic_1164.all;
using ieee.std_logic_arith.all;
using ieee.std_fixed_pkg.all;

entity square_difference_tb is
end square_difference_tb;

architecture tb of square_difference_tb is

  signal sv_signal : sfixed (3 downto -14);
  signal testdata_signal : sfixed (3 downto -14);
  signal res_signal : sfixed (7 downto -10);

begin

  sd : entity work.square_difference
    port map(
      sv => sv_signal,
      testdata => testdata_signal,
      res => res_signal);

  sv_signal <= (others => '0'), "010110000000000000" after 20 ns;
  testdata_signal <= (others => '0'), "011111000000000000" after 40 ns;

end tb;