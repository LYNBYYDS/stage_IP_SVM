----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: Square_Difference - Behavioral
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

entity Square_Difference is
    Port (  input_a : in std_logic_vector(27 downto 0);
            input_b : in std_logic_vector(27 downto 0);
            output : out std_logic_vector(43 downto 0);
            overflow : out std_logic
            );
end Square_Difference;

architecture Behavioral of Square_Difference is

component Subtractor_28bits is
    Port (  input_a : in std_logic_vector(27 downto 0);
            input_b : in std_logic_vector(27 downto 0);
            output : out std_logic_vector(27 downto 0);
            overflow : out std_logic
            );
end component;

component Square_28bits is
    Port (  input : in std_logic_vector(27 downto 0);
            output : out std_logic_vector(43 downto 0);
            overflow : out std_logic
            );
end component;

signal sub_s : std_logic_vector(27 downto 0);
signal sub_overflow : std_logic;
signal square_overflow : std_logic;

begin

    Subtractor_28bits_0 : Subtractor_28bits
        port map (  input_a => input_a,
                    input_b => input_b,
                    output =>  sub_s,
                    overflow => sub_overflow
            );

    Square_28bits_0 : Square_28bits
        port map (  input => sub_s,
                    output =>  output,
                    overflow => square_overflow
            );
            
    overflow <= sub_overflow or square_overflow;
            
end Behavioral;
