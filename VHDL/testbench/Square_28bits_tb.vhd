----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: Square_28bits_tb - Behavioral
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

entity Square_28bits_tb is
--  Port ( );
end Square_28bits_tb;

architecture Behavioral of Square_28bits_tb is

component Square_28bits is
    Port (  input : in std_logic_vector(27 downto 0);
            output : out std_logic_vector(43 downto 0);
            overflow : out std_logic
            );
end component;

signal input_s : std_logic_vector(27 downto 0) := (others => '0');
signal output_s : std_logic_vector(43 downto 0);
signal overflow_s : std_logic;

begin

    Square_28bits_0 : Square_28bits
        port map (  input => input_s,
                    output => output_s,
                    overflow => overflow_s
                    ); 

    input_s <= x"013fe34" after 10 ns, x"fffffff" after 20 ns;
    
end Behavioral;
