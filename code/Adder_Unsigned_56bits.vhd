----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:
-- Design Name: 
-- Module Name: Adder_Unsigned_56bits - Behavioral
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

entity Adder_Unsigned_56bits is
    Port (  carry_in : in std_logic;
            input_a : in std_logic_vector(55 downto 0);
            input_b : in std_logic_vector(55 downto 0);
            output : out std_logic_vector(55 downto 0);
            carry_out : out std_logic
            );
end Adder_Unsigned_56bits;

architecture Behavioral of Adder_Unsigned_56bits is

component Adder_Unsigned_1bit is 
    Port (  carry_in : in std_logic;
            input_a : in std_logic;
            input_b : in std_logic;
            output : out std_logic;
            carry_out : out std_logic
            );
end component;

signal output_s0 : std_logic_vector;
signal output_s0 : std_logic_vector;
signal output_s0 : std_logic_vector;
signal output_s0 : std_logic_vector;
signal output_s0 : std_logic_vector;
signal output_s0 : std_logic_vector;
signal output_s0 : std_logic_vector;
signal output_s0 : std_logic_vector;
signal output_s0 : std_logic_vector;
signal output_s0 : std_logic_vector;
signal output_s0 : std_logic_vector;
signal output_s0 : std_logic_vector;
signal output_s0 : std_logic_vector;
signal output_s0 : std_logic_vector;
signal output_s0 : std_logic_vector;
signal output_s0 : std_logic_vector;
signal output_s0 : std_logic_vector;
signal output_s0 : std_logic_vector;


begin
    
    Adder_Unsigned_1bit_0 : Adder_Unsigned_1bit
        port map (  carry_in => '0',
                    input_a => input_a_s(),
                    input_b => input_b_s,
                    output => ouput_s,
                    carry_out => carry_out_s
                    );
    
    output_s <=  input_a + input_b + carry_in;
    output <= output_s(55 downto 0);
    carry_out <= output_s(56);

end Behavioral;