----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: Square_Difference_27bits - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Square_Difference_27bits is
    Port (  input_a : in std_logic_vector(27 downto 0);
            input_b : in std_logic_vector(27 downto 0);
            output_s : out std_logic_vector(44 downto 0)
    );
end Square_Difference_27bits;

architecture Behavioral of Square_Difference_27bits is

component Adder_27bits is 
    Port (  carry_in : in std_logic;
            input_a : in std_logic_vector(27 downto 0);
            input_b : in std_logic_vector(27 downto 0);
            output_s : out std_logic_vector(27 downto 0);
            carry_out : out std_logic
            );
end component;

component Multiplier is 
    Port (  input_a : in std_logic_vector(27 downto 0);
            input_b : in std_logic_vector(27 downto 0);
            output_s : out std_logic_vector(44 downto 0)
            );
end component;

signal input_b_neg : std_logic_vector(27 downto 0);
signal diff_s : std_logic_vector(27 downto 0);
signal carry_s : std_logic;

begin

input_b_neg <= (not input_b(27)) & input_b(26 downto 0);

    Adder_27bits_0 : Adder_27bits
        port map (  carry_in => '0',
                    input_a => input_a,
                    input_b => input_b_neg,
                    output_s => diff_s,
                    carry_out => carry_s
                    );

    Multiplier_0 : Multiplier
        port map (  input_a => diff_s,
                    input_b => diff_s,
                    output_s => output_s
                    );
end Behavioral;
