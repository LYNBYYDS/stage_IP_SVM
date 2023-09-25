----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: Subtractor_28bits - Behavioral
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

entity Subtractor_28bits is
    Port (  input_a : in std_logic_vector(27 downto 0);
            input_b : in std_logic_vector(27 downto 0);
            output : out std_logic_vector(27 downto 0);
            overflow : out std_logic
            );
end Subtractor_28bits;

architecture Behavioral of Subtractor_28bits is

component Negate_28bits is 
    Port (  input : in std_logic_vector(27 downto 0);
            output : out std_logic_vector(27 downto 0)
            );
end component;

component Adder_Unsigned_28bits is
    Port (  carry_in : in std_logic;
            input_a : in std_logic_vector(27 downto 0);
            input_b : in std_logic_vector(27 downto 0);
            output : out std_logic_vector(27 downto 0);
            carry_out : out std_logic
            );
end component;

signal neg_b : std_logic_vector(27 downto 0);
signal output_s : std_logic_vector(27 downto 0);
signal carry_out_s : std_logic;

begin

    Negate_28bits_0 : Negate_28bits
        port map (  input => input_b,
                    output => neg_b);
                    
    Adder_Unsigned_28bits_0 : Adder_Unsigned_28bits
        port map (  carry_in => '0',
                    input_a => input_a,
                    input_b => neg_b,
                    output => output_s,
                    carry_out => carry_out_s
                    );

    output <= output_s;
    
    overflow <= '1' when output_s(27)/= input_a(27) and input_a(27) = neg_b(27) else
                '0';
    
end Behavioral;
