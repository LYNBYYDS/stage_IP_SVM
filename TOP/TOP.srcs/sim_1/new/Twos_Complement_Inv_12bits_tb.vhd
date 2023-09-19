----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: Twos_Complement_Inv_12bits_tb - Behavioral
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

entity Twos_Complement_Inv_12bits_tb is
--  Port ( );
end Twos_Complement_Inv_12bits_tb;

architecture Behavioral of Twos_Complement_Inv_12bits_tb is

component Twos_Complement_Inv_12bits is 
    Port (  input : in std_logic_vector(11 downto 0);
            output : out std_logic_vector(11 downto 0)
            );
end component;

signal input_s : std_logic_vector(11 downto 0) := (others => '0');
signal ouput_s : std_logic_vector(11 downto 0);

begin

    Twos_Complement_Inv_12bits_0 : Twos_Complement_Inv_12bits
        port map (  input => input_s,
                    output => ouput_s);

    input_s <= x"011" after 20 ns, x"fff" after 40 ns;

end Behavioral;

