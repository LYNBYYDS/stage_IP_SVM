----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: Square_28bits - Behavioral
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

entity Square_28bits is
    Port (  input : in std_logic_vector(28 downto 0);
            output : out std_logic_vector(43 downto 0)
            );
end Square_28bits;

architecture Behavioral of Square_28bits is

component Multiplier_28bits is 
    Port (  input_a : in std_logic_vector(27 downto 0);     
            input_b : in std_logic_vector(27 downto 0);
            output : out std_logic_vector(44 downto 0)   
            );
end component;

begin

Multiplier_28bits_0 : Multiplier_28bits
    port map (  input_a => input,
                input_b => input,
                output => output);

end Behavioral;
