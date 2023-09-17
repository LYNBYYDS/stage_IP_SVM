----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: Adder_15bits - Behavioral
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

entity Adder_15bits is
    Port (  carry_in : in std_logic;
            input_a : in std_logic_vector(14 downto 0);
            input_b : in std_logic_vector(14 downto 0);
            output : out std_logic_vector(14 downto 0);
            carry_out : out std_logic
            );
end Adder_15bits;

architecture Behavioral of Adder_15bits is

signal output_s : std_logic_vector(15 downto 0);

begin

    output_s <=  input_a(14 downto 0) + input_b(14 downto 0);
            
    carry_out <=    '1' when output_s(15) = '1' else
                    '0';
                
    output <= output_s(14 downto 0);
    
end Behavioral;
