----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: convertor_Signed_13to20bits - Behavioral
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

entity Convertor_Signed_13to20bits is
    Port (  input : in std_logic_vector(12 downto 0);
            output : out std_logic_vector(19 downto 0)
            );
end Convertor_Signed_13to20bits;

architecture Behavioral of Convertor_Signed_13to20bits is

component Twos_Complement_Inv_13bits is
    Port (  input : in std_logic_vector(12 downto 0);
            output : out std_logic_vector(12 downto 0)
            );
end component;

component Twos_Complement_20bits is
    Port (  input : in std_logic_vector(19 downto 0);
            output : out std_logic_vector(19 downto 0)
            );
end component;

signal ca2_inv_s : std_logic_vector(12 downto 0);
signal ca2_inv_20bits_s : std_logic_vector(19 downto 0);
signal ca2_s : std_logic_vector(19 downto 0);

begin

    Twos_Complement_Inv_13bits_0 : Twos_Complement_Inv_13bits
        port map(   input => input,
                    output => ca2_inv_s
                    );
        
    ca2_inv_20bits_s <= "0000000" & ca2_inv_s;
    
    Twos_Complement_20bits_0 : Twos_Complement_20bits
        port map(   input => ca2_inv_20bits_s,
                    output => ca2_s
                    );
               
    output <=   ca2_s when input(12) = '1' else 
                "0000000" & input;
                
end Behavioral;
