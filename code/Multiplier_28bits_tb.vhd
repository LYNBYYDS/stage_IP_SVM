----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/08/22 23:48:44
-- Design Name: 
-- Module Name: Multiplier_28bits_tb - Behavioral
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

entity Multiplier_28bits_tb is
--  Port ( );
end Multiplier_28bits_tb;

architecture Behavioral of Multiplier_28bits_tb is

component Multiplier_28bits is 
    Port (  input_a : in std_logic_vector(27 downto 0);     
            input_b : in std_logic_vector(27 downto 0);
            output : out std_logic_vector(44 downto 0)   
            );
end component;

signal input_a_s : std_logic_vector(27 downto 0) := "0000000000000000000000000000";
signal input_b_s : std_logic_vector(27 downto 0) := "0000000000000000000000000000";
signal ouput_s : std_logic_vector(44 downto 0);

begin

    Multiplier_28bits_0 : Multiplier_28bits
        port map (  input_a => input_a_s,
                    input_b => input_b_s,
                    output => ouput_s);
                    
    input_a_s <= "0000000000000000000000000001" after 10 ns, "1111111111111111111111111111" after 30 ns;
    input_b_s <= "0000000000000000000000000001" after 20 ns, "1111111111111111111111111111" after 40 ns;

end Behavioral;
