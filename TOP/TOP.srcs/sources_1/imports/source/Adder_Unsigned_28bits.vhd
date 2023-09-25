----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: Adder_Unsigned_28bits - Behavioral
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

entity Adder_Unsigned_28bits is
    Port (  carry_in : in std_logic;
            input_a : in std_logic_vector(27 downto 0);
            input_b : in std_logic_vector(27 downto 0);
            output : out std_logic_vector(27 downto 0);
            carry_out : out std_logic
            );
end Adder_Unsigned_28bits;

architecture Behavioral of Adder_Unsigned_28bits is

component Adder_Unsigned_4bits is 
    Port (  carry_in : in std_logic;
            input_a : in std_logic_vector(3 downto 0);
            input_b : in std_logic_vector(3 downto 0);
            output : out std_logic_vector(3 downto 0);
            carry_out : out std_logic
            );
end component;

component Adder_Unsigned_8bits is 
    Port (  carry_in : in std_logic;
            input_a : in std_logic_vector(7 downto 0);
            input_b : in std_logic_vector(7 downto 0);
            output : out std_logic_vector(7 downto 0);
            carry_out : out std_logic
            );
end component;

component Adder_Unsigned_16bits is 
    Port (  carry_in : in std_logic;
            input_a : in std_logic_vector(15 downto 0);
            input_b : in std_logic_vector(15 downto 0);
            output : out std_logic_vector(15 downto 0);
            carry_out : out std_logic
            );
end component;

signal output_s0 : std_logic_vector(3 downto 0);
signal output_s1 : std_logic_vector(7 downto 0);
signal output_s2 : std_logic_vector(15 downto 0);
signal carry_out_s0 : std_logic;
signal carry_out_s1 : std_logic;
signal carry_out_s2 : std_logic;

begin
    
    Adder_Unsigned_4bits_0 : Adder_Unsigned_4bits
        port map (  carry_in => carry_in,
                    input_a => input_a(3 downto 0),
                    input_b => input_b(3 downto 0),
                    output => output_s0,
                    carry_out => carry_out_s0
                    );
    
    Adder_Unsigned_8bits_0 : Adder_Unsigned_8bits
        port map (  carry_in => carry_out_s0,
                    input_a => input_a(11 downto 4),
                    input_b => input_b(11 downto 4),
                    output => output_s1,
                    carry_out => carry_out_s1
                    );
    
    Adder_Unsigned_16bits_0 : Adder_Unsigned_16bits
        port map (  carry_in => carry_out_s1,
                    input_a => input_a(27 downto 12),
                    input_b => input_b(27 downto 12),
                    output => output_s2,
                    carry_out => carry_out_s2
                    );
          
    output <= output_s2 &output_s1 & output_s0;
    carry_out <= carry_out_s2;
    
end Behavioral;
