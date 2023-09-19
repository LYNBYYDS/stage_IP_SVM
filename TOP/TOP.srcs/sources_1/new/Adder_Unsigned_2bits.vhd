----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: Adder_Unsigned_2bits - Behavioral
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

entity Adder_Unsigned_2bits is
    Port (  carry_in : in std_logic;
            input_a : in std_logic_vector(1 downto 0);
            input_b : in std_logic_vector(1 downto 0);
            output : out std_logic_vector(1 downto 0);
            carry_out : out std_logic
            );
end Adder_Unsigned_2bits;

architecture Behavioral of Adder_Unsigned_2bits is

component Adder_Unsigned_1bit is 
    Port (  carry_in : in std_logic;
            input_a : in std_logic;
            input_b : in std_logic;
            output : out std_logic;
            carry_out : out std_logic
            );
end component;

signal output_s0 : std_logic;
signal output_s1 : std_logic;
signal carry_out_s0 : std_logic;
signal carry_out_s1 : std_logic;

begin
    
    Adder_Unsigned_1bit_0 : Adder_Unsigned_1bit
        port map (  carry_in => carry_in,
                    input_a => input_a(0),
                    input_b => input_b(0),
                    output => output_s0,
                    carry_out => carry_out_s0
                    );
    
    Adder_Unsigned_1bit_1 : Adder_Unsigned_1bit
        port map (  carry_in => carry_out_s0,
                    input_a => input_a(1),
                    input_b => input_b(1),
                    output => output_s1,
                    carry_out => carry_out_s1
                    );       
                               
    output <=  output_s1 & output_s0;
    carry_out <= carry_out_s1;
    
end Behavioral;
