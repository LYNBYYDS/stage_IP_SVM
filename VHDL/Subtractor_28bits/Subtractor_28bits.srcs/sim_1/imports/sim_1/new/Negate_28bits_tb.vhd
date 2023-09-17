----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/08/22 22:09:29
-- Design Name: 
-- Module Name: Negate_28bits_tb - Behavioral
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

entity Negate_28bits_tb is
--  Port ( );
end Negate_28bits_tb;

architecture Behavioral of Negate_28bits_tb is

component Negate_28bits is 
    Port (  input : in std_logic_vector(27 downto 0);
            output : out std_logic_vector(27 downto 0)
            );
end component;

signal input_s : std_logic_vector(27 downto 0) := "0000000000000000000000000000";
signal ouput_s : std_logic_vector(27 downto 0);

begin

    Negate_28bits_0 : Negate_28bits
        port map (  input => input_s,
                    output => ouput_s);

    input_s <= "0000000000000000000000000001" after 20 ns, "1111111111111111111111111111" after 40 ns;

end Behavioral;
