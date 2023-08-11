----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/07/23 19:49:23
-- Design Name: 
-- Module Name: Twos_Complement - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Twos_Complement is
    Port (  input_a : in std_logic_vector(27 downto 0);
            output_s : out std_logic_vector(27 downto 0)
            );
end Twos_Complement;

architecture Behavioral of Twos_Complement is

begin

    output_s <= (not ('0'&input_a(26 downto 0))) + '1' when input_a(27) = '1' else
                input_a;
    
end Behavioral;
