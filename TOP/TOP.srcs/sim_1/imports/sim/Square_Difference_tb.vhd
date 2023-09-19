----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:
-- Design Name: 
-- Module Name: Square_Difference_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Square_Difference_tb is
--  Port ( );
end Square_Difference_tb;

architecture Behavioral of Square_Difference_tb is

component Square_Difference is
    Port (  input_a : in std_logic_vector(27 downto 0);
            input_b : in std_logic_vector(27 downto 0);
            output : out std_logic_vector(43 downto 0);
            overflow : out std_logic
            );
end component;

signal input_a_s : std_logic_vector(27 downto 0) := (others => '0');
signal input_b_s : std_logic_vector(27 downto 0) := (others => '0');
signal output_s : std_logic_vector(43 downto 0);
signal overflow_s : std_logic;

begin

    Square_Difference_0 : Square_Difference
        port map (  input_a => input_a_s,
                    input_b => input_b_s,
                    output => output_s,
                    overflow => overflow_s
                    ); 

    input_a_s <= x"013fe34" after 10 ns, x"001665f" after 30 ns;
    input_b_s <= x"035ef24" after 20 ns, x"fffffff" after 40 ns;
    
end Behavioral;
