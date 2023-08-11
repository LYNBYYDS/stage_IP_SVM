----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/07/2023 03:08:49 PM
-- Design Name: 
-- Module Name: Kernal_rbf - Behavioral
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

entity Kernal_rbf is
    Port (  SV_dim0 : in std_logic_vector(27 downto 0);
            SV_dim1 : in std_logic_vector(27 downto 0);
            SV_dim2 : in std_logic_vector(27 downto 0);
            SV_dim3 : in std_logic_vector(27 downto 0);
            SV_dim4 : in std_logic_vector(27 downto 0);
            SV_dim5 : in std_logic_vector(27 downto 0);
            SV_dim6 : in std_logic_vector(27 downto 0);
            SV_dim7 : in std_logic_vector(27 downto 0);
            test_data : in std_logic_vector(27 downto 0);
            output : out std_logic_vector(43 downto 0)
            );
end Kernal_rbf;

architecture Behavioral of Kernal_rbf is

component Square_Difference is
    Port (  input_a : in std_logic_vector(27 downto 0);
            input_b : in std_logic_vector(27 downto 0);
            output : out std_logic_vector(43 downto 0)
            );
end component;

component Adder_44bits is
    Port (  carry_in : in std_logic;
            input_a : in std_logic_vector(44 downto 0);
            input_b : in std_logic_vector(44 downto 0);
            output : out std_logic_vector(44 downto 0);
            carry_out : out std_logic
            );
end component;

signal sqrt_s0 : std_logic_vector(43 downto 0);
signal sqrt_s1 : std_logic_vector(43 downto 0);
signal sqrt_s2 : std_logic_vector(43 downto 0);
signal sqrt_s3 : std_logic_vector(43 downto 0);
signal sqrt_s4 : std_logic_vector(43 downto 0);
signal sqrt_s5 : std_logic_vector(43 downto 0);
signal sqrt_s6 : std_logic_vector(43 downto 0);
signal sqrt_s7 : std_logic_vector(43 downto 0);
signal carry_s00 : std_logic;
signal carry_s01 : std_logic;
signal carry_s02 : std_logic;
signal carry_s03 : std_logic;
signal carry_s10 : std_logic;
signal carry_s11 : std_logic;
signal carry_s20 : std_logic;

begin

    Square_Difference_0 : Square_Difference
        port map (  input_a => SV_dim0,
                    input_b => test_data,
                    output => sqrt_s0
                    );
                    
    Square_Difference_1 : Square_Difference
        port map (  input_a => SV_dim1,
                    input_b => test_data,
                    output => sqrt_s1
                    );
                    
    Square_Difference_2 : Square_Difference
        port map (  input_a => SV_dim2,
                    input_b => test_data,
                    output => sqrt_s2
                    );
                    
    Square_Difference_3 : Square_Difference
        port map (  input_a => SV_dim3,
                    input_b => test_data,
                    output => sqrt_s3
                    );
                    
    Square_Difference_4 : Square_Difference
        port map (  input_a => SV_dim4,
                    input_b => test_data,
                    output => sqrt_s4
                    );
                    
    Square_Difference_5 : Square_Difference
        port map (  input_a => SV_dim5,
                    input_b => test_data,
                    output => sqrt_s75
                    );
                    
    Square_Difference_6 : Square_Difference
        port map (  input_a => SV_dim6,
                    input_b => test_data,
                    output => sqrt_s6
                    );
                    
    Square_Difference_7 : Square_Difference
        port map (  input_a => SV_dim7,
                    input_b => test_data,
                    output => sqrt_s7
                    );
                    
                    
    Adder_44bits_00 : Adder_44bits
        port map (  carry_in => '0',
                    input_a => sqrt_s0,
                    input_b => sqrt_s1,
                    output => add_s00,
                    carry_out => carry_s00
                    );
                    
    Adder_44bits_01 : Adder_44bits
        port map (  carry_in => '0',
                    input_a => sqrt_s2,
                    input_b => sqrt_s3,
                    output => add_s01,
                    carry_out => carry_s01
                    );
                    
    Adder_44bits_02 : Adder_44bits
        port map (  carry_in => '0',
                    input_a => sqrt_s4,
                    input_b => sqrt_s5,
                    output => add_s02,
                    carry_out => carry_s02
                    );
                    
    Adder_44bits_03 : Adder_44bits
        port map (  carry_in => '0',
                    input_a => sqrt_s6,
                    input_b => sqrt_s7,
                    output => add_s03,
                    carry_out => carry_s03
                    );
                    
    Adder_44bits_10 : Adder_44bits
        port map (  carry_in => '0',
                    input_a => add_s00,
                    input_b => add_s01,
                    output => add_s10,
                    carry_out => carry_s10
                    );
                    
    Adder_44bits_11 : Adder_44bits
        port map (  carry_in => '0',
                    input_a => add_s02,
                    input_b => add_s03,
                    output => add_s11,
                    carry_out => carry_s11
                    );
                    
    Adder_44bits_20 : Adder_44bits
        port map (  carry_in => '0',
                    input_a => add_s10,
                    input_b => add_s11,
                    output => add_s20,
                    carry_out => carry_s20
                    );

end Behavioral;
