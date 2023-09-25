----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: Adder_Signed_20bits_tb - Behavioral
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

entity Adder_Signed_20bits_tb is
--  Port ( );
end Adder_Signed_20bits_tb;

architecture Behavioral of Adder_Signed_20bits_tb is

component Adder_Signed_20bits is
    Port (  input_a : in std_logic_vector(19 downto 0);
            input_b : in std_logic_vector(19 downto 0);
            output : out std_logic_vector(19 downto 0);
            overflow : out std_logic
            );
end component;

signal input_a_s : std_logic_vector(19 downto 0) := (others => '0');
signal input_b_s : std_logic_vector(19 downto 0) := (others => '0');
signal output_s : std_logic_vector(19 downto 0);
signal overflow_s : std_logic;

begin

    Adder_Signed_20bits_0 : Adder_Signed_20bits
        port map (  input_a => input_a_s,
                    input_b => input_b_s,
                    output => output_s,
                    overflow => overflow_s
                    );
                    
    input_a_s <= x"fffff" after 10 ns, x"f142f" after 30 ns;
    input_b_s <= x"00001" after 20 ns, x"f451f" after 40 ns;

end Behavioral;
