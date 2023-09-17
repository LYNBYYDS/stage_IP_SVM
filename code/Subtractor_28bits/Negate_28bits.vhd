----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: Negate_28bits - Behavioral
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

entity Negate_28bits is
    Port (  input : in std_logic_vector(27 downto 0);
            output : out std_logic_vector(27 downto 0)
            );
end Negate_28bits;

architecture Behavioral of Negate_28bits is

component Twos_Complement_28bits is 
    Port (  input : in std_logic_vector(27 downto 0);
            output : out std_logic_vector(27 downto 0)
            );
end component;

component Twos_Complement_Inv_28bits is 
    Port (  input : in std_logic_vector(27 downto 0);
            output : out std_logic_vector(27 downto 0)
            );
end component;

signal ca2_s : std_logic_vector(27 downto 0);
signal ca2_inv_s : std_logic_vector(27 downto 0);

begin
    
    Twos_Complement_0 : Twos_Complement_28bits
    port map (  input => input,
                output => ca2_s);
                
    Twos_Complement_Inv_0 : Twos_Complement_Inv_28bits
    port map (  input => input,
                output => ca2_inv_s);
   
    output <=   ca2_s when input(27) = '0' else 
                ca2_inv_s;
end Behavioral;
