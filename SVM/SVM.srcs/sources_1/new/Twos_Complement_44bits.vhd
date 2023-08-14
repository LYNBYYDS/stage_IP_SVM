----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: Twos_Complement_44bits - Behavioral
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

entity Twos_Complement_44bits is
    Port (  input_a : in std_logic_vector(44 downto 0);
            output_s : out std_logic_vector(44 downto 0)
            );
end Twos_Complement_44bits;

architecture Behavioral of Twos_Complement_44bits is

begin

    output_s <= (not ('0'&input_a(43 downto 0))) + '1' when input_a(44) = '1' else
                    input_a;
                
end Behavioral;
