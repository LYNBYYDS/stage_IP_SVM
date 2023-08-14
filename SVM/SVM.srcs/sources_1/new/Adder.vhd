----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Adder is
    Port (  carry_in : in std_logic;
            input_a : in std_logic_vector(27 downto 0);
            input_b : in std_logic_vector(27 downto 0);
            output_s : out std_logic_vector(27 downto 0);
            carry_out : out std_logic
    );
end Adder;

architecture Behavioral of Adder is

signal s_s : std_logic_vector(27 downto 0);
signal ss_s : std_logic_vector(27 downto 0);
signal ca2_a : std_logic_vector(27 downto 0);
signal ca2_b : std_logic_vector(27 downto 0);

component Twos_Complement is 
    Port (  input_a : in std_logic_vector(27 downto 0);
            output_s : out std_logic_vector(27 downto 0)
            );
end component;

component Twos_Complement_Inv is 
    Port (  input_a : in std_logic_vector(27 downto 0);
            output_s : out std_logic_vector(27 downto 0)
            );
end component;

begin

    Twos_Complement_a : Twos_Complement
    port map (  input_a => input_a,
                output_s => ca2_a);
                
    Twos_Complement_b : Twos_Complement
    port map (  input_a => input_b,
                output_s => ca2_b);
                
    Twos_Complement_Inv_0 : Twos_Complement_Inv
    port map (  input_a => ss_s,
                output_s => output_s);
                
    s_s <=  input_a(26 downto 0) + input_b(26 downto 0) + carry_in when input_a(27) = input_b(27) else
            ca2_a + input_b when (input_a(27) = '1' and input_b(27) = '0') else 
            input_a + ca2_b;
            
    carry_out <=    '1' when (input_a(27) = input_b(27) and s_s(27) = '1') else
                    '0';
                
    ss_s <= input_a(27) & s_s(26 downto 0) when input_a(27) = input_b(27) else
                s_s;
                
end Behavioral;
