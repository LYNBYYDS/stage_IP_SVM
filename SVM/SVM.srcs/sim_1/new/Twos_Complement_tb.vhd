----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/07/23 19:56:19
-- Design Name: 
-- Module Name: Twos_Complement_tb - Behavioral
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

entity Twos_Complement_tb is
--  Port ( );
end Twos_Complement_tb;

architecture Behavioral of Twos_Complement_tb is

component Twos_Complement is 
    Port (  input_a : in std_logic_vector(17 downto 0);
            output_s : out std_logic_vector(17 downto 0)
            );
end component;

signal a_s : std_logic_vector(17 downto 0) := (others => '0');
signal s_s : std_logic_vector(17 downto 0);

begin

    Twos_Complement_0 : Twos_Complement
    port map (  input_a => a_s,
                output_s => s_s);
                
    a_s <= "101101001000100100" after 20 ns;

end Behavioral;
