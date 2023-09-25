----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:
-- Design Name: 
-- Module Name: Adder_Unsigned_44bits_tb - Behavioral
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

entity Adder_Unsigned_44bits_tb is
--  Port ( );
end Adder_Unsigned_44bits_tb;

architecture Behavioral of Adder_Unsigned_44bits_tb is

component Adder_Unsigned_44bits is
    Port (  carry_in : in std_logic;
            input_a : in std_logic_vector(43 downto 0);
            input_b : in std_logic_vector(43 downto 0);
            output : out std_logic_vector(43 downto 0);
            carry_out : out std_logic
            );
end component;

signal carry_in_s : std_logic := '0';
signal input_a_s : std_logic_vector(43 downto 0) := (others => '0');
signal input_b_s : std_logic_vector(43 downto 0) := (others => '0');
signal ouput_s : std_logic_vector(43 downto 0);
signal carry_out_s : std_logic;
begin

    Adder_Unsigned_44bits_0 : Adder_Unsigned_44bits
        port map (  carry_in => carry_in_s,
                    input_a => input_a_s,
                    input_b => input_b_s,
                    output => ouput_s,
                    carry_out => carry_out_s
                    );

    input_a_s <= x"fffffffffff" after 20 ns, x"00000000001" after 40 ns;
    input_b_s <= x"00000000001" after 30 ns, x"ffffffffff1" after 50 ns;

end Behavioral;
