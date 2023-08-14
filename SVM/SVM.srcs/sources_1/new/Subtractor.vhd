----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: Subtractor - Behavioral
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

entity Subtractor is
    Port (  input_a : in std_logic_vector(17 downto 0);
            input_b : in std_logic_vector(17 downto 0);
            output_s : out std_logic_vector(8 downto 0);
            overflow : out std_logic
    );
end Subtractor;

architecture Behavioral of Subtractor is

signal s_s : std_logic_vector(17 downto 0);
signal ss_s : std_logic_vector(17 downto 0);
signal ca2_a : std_logic_vector(17 downto 0);
signal ca2_b : std_logic_vector(17 downto 0);

component Twos_Complement is 
    Port (  input_a : in std_logic_vector(17 downto 0);
            output_s : out std_logic_vector(17 downto 0)
            );
end component;

component Twos_Complement_Inv is 
    Port (  input_a : in std_logic_vector(17 downto 0);
            output_s : out std_logic_vector(17 downto 0)
            );
end component;

begin


end Behavioral;
