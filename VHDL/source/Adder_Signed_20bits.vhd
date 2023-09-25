----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: Adder_Signed_20bits - Behavioral
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

entity Adder_Signed_20bits is
    Port (  input_a : in std_logic_vector(19 downto 0);
            input_b : in std_logic_vector(19 downto 0);
            output : out std_logic_vector(19 downto 0);
            overflow : out std_logic
            );
end Adder_Signed_20bits;

architecture Behavioral of Adder_Signed_20bits is   -- 16 + 4

component Adder_Unsigned_16bits is 
    Port (  carry_in : in std_logic;
            input_a : in std_logic_vector(15 downto 0);
            input_b : in std_logic_vector(15 downto 0);
            output : out std_logic_vector(15 downto 0);
            carry_out : out std_logic
            );
end component;

component Adder_Unsigned_4bits is 
    Port (  carry_in : in std_logic;
            input_a : in std_logic_vector(3 downto 0);
            input_b : in std_logic_vector(3 downto 0);
            output : out std_logic_vector(3 downto 0);
            carry_out : out std_logic
            );
end component;

signal output_s0 : std_logic_vector(15 downto 0);
signal output_s1 : std_logic_vector(3 downto 0);
signal carry_out_s0 : std_logic;
signal carry_out_s1 : std_logic;

begin

    Adder_Unsigned_16bits_0 : Adder_Unsigned_16bits
        port map (  carry_in => '0',
                    input_a => input_a(15 downto 0),
                    input_b => input_b(15 downto 0),
                    output => output_s0,
                    carry_out => carry_out_s0
                    );

    Adder_Unsigned_4bits_0 : Adder_Unsigned_4bits
        port map (  carry_in => carry_out_s0,
                    input_a => input_a(19 downto 16),
                    input_b => input_b(19 downto 16),
                    output => output_s1,
                    carry_out => carry_out_s1
                    );
          
    output <= output_s1 & output_s0;
    
    -- '+' + '+' = '-' or '-' + '-' = '+'
    overflow <= '1' when (input_a(19) = '0' and input_b(19) = '0' and output_s1(3) = '1') or (input_a(19) = '1' and input_b(19) = '1' and output_s1(3) = '0') else
                '0';
              
end Behavioral;
