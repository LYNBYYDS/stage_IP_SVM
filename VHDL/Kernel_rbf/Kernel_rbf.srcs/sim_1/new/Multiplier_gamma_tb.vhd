----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/02/2023 11:32:23 PM
-- Design Name: 
-- Module Name: Multiplier_gamma_tb - Behavioral
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

entity Multiplier_gamma_tb is
--  Port ( );
end Multiplier_gamma_tb;

architecture Behavioral of Multiplier_gamma_tb is

component Multiplier_gamma is 
    Port (  input_a : in std_logic_vector(43 downto 0);     
            input_b : in std_logic_vector(11 downto 0);
            output : out std_logic_vector(43 downto 0)  
            );
end component;

signal input_a_s : std_logic_vector(43 downto 0) := (others => '0');
signal input_b_s : std_logic_vector(11 downto 0) := "010110001110"; -- 1.3888*1024
signal ouput_s : std_logic_vector(43 downto 0);

begin

    Multiplier_gamma_0 : Multiplier_gamma
        port map (  input_a => input_a_s,
                    input_b => input_b_s,
                    output => ouput_s
                    );
                    
    input_a_s <= x"00000000001" after 10 ns, x"eafffffffff" after 30 ns, x"feff1fea3ff" after 50 ns, x"013F3578E34" after 70 ns;
    
end Behavioral;
