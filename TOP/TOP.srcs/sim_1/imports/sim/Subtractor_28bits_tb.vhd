----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: Subtractor_28bits_tb - Behavioral
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

entity Subtractor_28bits_tb is
--  Port ( );
end Subtractor_28bits_tb;

architecture Behavioral of Subtractor_28bits_tb is

component Subtractor_28bits is
    Port (  input_a : in std_logic_vector(27 downto 0);
            input_b : in std_logic_vector(27 downto 0);
            output : out std_logic_vector(27 downto 0);
            overflow : out std_logic
            );
end component;

signal input_a_s : std_logic_vector(27 downto 0) := (others => '0');
signal input_b_s : std_logic_vector(27 downto 0) := (others => '0');
signal ouput_s : std_logic_vector(27 downto 0);
signal overflow_s : std_logic;
begin

    Subtractor_28bits_0 : Subtractor_28bits
        port map (  input_a => input_a_s,
                    input_b => input_b_s,
                    output => ouput_s,
                    overflow => overflow_s
                    );

    input_a_s <= x"7ffffff" after 20 ns, x"0000000" after 40 ns;
    input_b_s <= x"8000001" after 30 ns, x"ffffff1" after 50 ns;

end Behavioral;

