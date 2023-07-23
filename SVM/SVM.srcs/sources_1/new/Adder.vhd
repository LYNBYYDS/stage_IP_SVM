----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/07/23 16:49:01
-- Design Name: 
-- Module Name: Adder - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Adder is
    Port (  input_a : in std_logic_vector(17 downto 0);
            input_b : in std_logic_vector(17 downto 0);
            output_s : out std_logic_vector(8 downto 0);
            error : out std_logic
    );
end Adder;

architecture Behavioral of Adder is

signal inter_s : std_logic_vector(18 downto 0);

begin

    inter_s <=  input_a + input_b when input_a(17) = input_b(17) else
                


end Behavioral;
