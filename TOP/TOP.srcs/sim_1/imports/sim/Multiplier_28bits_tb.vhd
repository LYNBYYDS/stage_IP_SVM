----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 
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
            output : out std_logic_vector(55 downto 0)  -- 55 for debug 
            );
end component;

signal input_a_s : std_logic_vector(27 downto 0) := (others => '0');
signal input_b_s : std_logic_vector(27 downto 0) := (others => '0');
signal ouput_s : std_logic_vector(55 downto 0);

begin

    Multiplier_28bits_0 : Multiplier_28bits
        port map (  input_a => input_a_s,
                    input_b => input_b_s,
                    output => ouput_s
                    );
                    
    input_a_s <= x"0000001" after 10 ns, x"fffffff" after 30 ns, x"feff1ff" after 50 ns, x"013FE34" after 70 ns;
    input_b_s <= x"0000001" after 20 ns, x"fffffff" after 40 ns, x"4f2f3ff" after 60 ns, x"013FE34" after 70 ns;

end Behavioral;
