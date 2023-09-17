----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: Adder_28bits - Behavioral
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

entity Adder_28bits is
    Port (  carry_in : in std_logic;
            input_a : in std_logic_vector(28 downto 0);
            input_b : in std_logic_vector(28 downto 0);
            output : out std_logic_vector(28 downto 0);
            carry_out : out std_logic
            );
end Adder_28bits;

architecture Behavioral of Adder_28bits is

component Negate_28bits is 
    Port (  input_a : in std_logic_vector(27 downto 0);
            output : out std_logic_vector(27 downto 0)
            );
end component;

signal neg_b : std_logic_vector(27 downto 0);
signal output_s : std_logic_vector(28 downto 0);

begin

    Negate_28bits_0 : Negate_28bits
        port map (  input_a => input_b,
                    output => neg_b);

    output_s <=  input_a(27 downto 0) + input_b(27 downto 0);
            
    carry_out <=    '1' when (input_a(27) = input_b(27) and output_s(28) = '1') else
                    '0';
                
    output <= output_s(28 downto 0);
    
end Behavioral;
