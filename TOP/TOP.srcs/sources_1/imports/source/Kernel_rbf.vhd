----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: Kernel_rbf - Behavioral
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

entity Kernel_rbf is
    Port (  SV_dim0 : in std_logic_vector(27 downto 0);
            SV_dim1 : in std_logic_vector(27 downto 0);
            SV_dim2 : in std_logic_vector(27 downto 0);
            SV_dim3 : in std_logic_vector(27 downto 0);
            SV_dim4 : in std_logic_vector(27 downto 0);
            SV_dim5 : in std_logic_vector(27 downto 0);
            SV_dim6 : in std_logic_vector(27 downto 0);
            SV_dim7 : in std_logic_vector(27 downto 0);
            test_data_dim0 : in std_logic_vector(27 downto 0);
            test_data_dim1 : in std_logic_vector(27 downto 0);
            test_data_dim2 : in std_logic_vector(27 downto 0);
            test_data_dim3 : in std_logic_vector(27 downto 0);
            test_data_dim4 : in std_logic_vector(27 downto 0);
            test_data_dim5 : in std_logic_vector(27 downto 0);
            test_data_dim6 : in std_logic_vector(27 downto 0);
            test_data_dim7 : in std_logic_vector(27 downto 0);
            gamma : in std_logic_vector(11 downto 0);
            output : out std_logic_vector(10 downto 0)
            );
end Kernel_rbf;

architecture Behavioral of Kernel_rbf is

component Square_Difference is
    Port (  input_a : in std_logic_vector(27 downto 0);
            input_b : in std_logic_vector(27 downto 0);
            output : out std_logic_vector(43 downto 0);
            overflow : out std_logic
            );
end component;

component Adder_Unsigned_44bits is
    Port (  carry_in : in std_logic;
            input_a : in std_logic_vector(43 downto 0);
            input_b : in std_logic_vector(43 downto 0);
            output : out std_logic_vector(43 downto 0);
            carry_out : out std_logic
            );
end component;

component Multiplier_gamma is
    Port (  input_a : in std_logic_vector(43 downto 0);     
            input_b : in std_logic_vector(11 downto 0);
            output : out std_logic_vector(43 downto 0)  
            );
end component;

component Exponential is
    Port (  input : in std_logic_vector(43 downto 0);
            output : out std_logic_vector(10 downto 0)
            );
end component;

signal SD_s0 : std_logic_vector(43 downto 0);
signal SD_s1 : std_logic_vector(43 downto 0);
signal SD_s2 : std_logic_vector(43 downto 0);
signal SD_s3 : std_logic_vector(43 downto 0);
signal SD_s4 : std_logic_vector(43 downto 0);
signal SD_s5 : std_logic_vector(43 downto 0);
signal SD_s6 : std_logic_vector(43 downto 0);
signal SD_s7 : std_logic_vector(43 downto 0);
signal SD_overflow_s0 : std_logic;
signal SD_overflow_s1 : std_logic;
signal SD_overflow_s2 : std_logic;
signal SD_overflow_s3 : std_logic;
signal SD_overflow_s4 : std_logic;
signal SD_overflow_s5 : std_logic;
signal SD_overflow_s6 : std_logic;
signal SD_overflow_s7 : std_logic;
signal AD_s00 : std_logic_vector(43 downto 0);
signal AD_s01 : std_logic_vector(43 downto 0);
signal AD_s02 : std_logic_vector(43 downto 0);
signal AD_s03 : std_logic_vector(43 downto 0);
signal AD_s10 : std_logic_vector(43 downto 0);
signal AD_s11 : std_logic_vector(43 downto 0);
signal AD_s20 : std_logic_vector(43 downto 0);
signal AD_carry_out_s00 : std_logic;
signal AD_carry_out_s01 : std_logic;
signal AD_carry_out_s02 : std_logic;
signal AD_carry_out_s03 : std_logic;
signal AD_carry_out_s10 : std_logic;
signal AD_carry_out_s11 : std_logic;
signal AD_carry_out_s20 : std_logic;

signal MULT_s : std_logic_vector(43 downto 0);

begin

    Square_Difference_0 : Square_Difference
        port map (  input_a => test_data_dim0,
                    input_b => SV_dim0,
                    output =>  SD_s0,
                    overflow => SD_overflow_s0
                    );

    Square_Difference_1 : Square_Difference
        port map (  input_a => test_data_dim1,
                    input_b => SV_dim1,
                    output =>  SD_s1,
                    overflow => SD_overflow_s1
                    );

    Square_Difference_2 : Square_Difference
        port map (  input_a => test_data_dim2,
                    input_b => SV_dim2,
                    output =>  SD_s2,
                    overflow => SD_overflow_s2
                    );

    Square_Difference_3 : Square_Difference
        port map (  input_a => test_data_dim3,
                    input_b => SV_dim3,
                    output =>  SD_s3,
                    overflow => SD_overflow_s3
                    );

    Square_Difference_4 : Square_Difference
        port map (  input_a => test_data_dim4,
                    input_b => SV_dim4,
                    output =>  SD_s4,
                    overflow => SD_overflow_s4
                    );

    Square_Difference_5 : Square_Difference
        port map (  input_a => test_data_dim5,
                    input_b => SV_dim5,
                    output =>  SD_s5,
                    overflow => SD_overflow_s5
                    );

    Square_Difference_6 : Square_Difference
        port map (  input_a => test_data_dim6,
                    input_b => SV_dim6,
                    output =>  SD_s6,
                    overflow => SD_overflow_s6
                    );

    Square_Difference_7 : Square_Difference
        port map (  input_a => test_data_dim7,
                    input_b => SV_dim7,
                    output =>  SD_s7,
                    overflow => SD_overflow_s7
                    );

    Adder_Unsigned_44bits_00 : Adder_Unsigned_44bits
        port map (  carry_in => '0',
                    input_a => SD_s0,
                    input_b => SD_s1,
                    output => AD_s00,
                    carry_out => AD_carry_out_s00
                    );

    Adder_Unsigned_44bits_01 : Adder_Unsigned_44bits
        port map (  carry_in => '0',
                    input_a => SD_s2,
                    input_b => SD_s3,
                    output => AD_s01,
                    carry_out => AD_carry_out_s01
                    );

    Adder_Unsigned_44bits_02 : Adder_Unsigned_44bits
        port map (  carry_in => '0',
                    input_a => SD_s4,
                    input_b => SD_s5,
                    output => AD_s02,
                    carry_out => AD_carry_out_s02
                    );

    Adder_Unsigned_44bits_03 : Adder_Unsigned_44bits
        port map (  carry_in => '0',
                    input_a => SD_s6,
                    input_b => SD_s7,
                    output => AD_s03,
                    carry_out => AD_carry_out_s03
                    );

    Adder_Unsigned_44bits_10 : Adder_Unsigned_44bits
        port map (  carry_in => '0',
                    input_a => AD_s00,
                    input_b => AD_s01,
                    output => AD_s10,
                    carry_out => AD_carry_out_s10
                    );

    Adder_Unsigned_44bits_11 : Adder_Unsigned_44bits
        port map (  carry_in => '0',
                    input_a => AD_s02,
                    input_b => AD_s03,
                    output => AD_s11,
                    carry_out => AD_carry_out_s11
                    );

    Adder_Unsigned_44bits_20 : Adder_Unsigned_44bits
        port map (  carry_in => '0',
                    input_a => AD_s10,
                    input_b => AD_s11,
                    output => AD_s20,
                    carry_out => AD_carry_out_s20
                    );
                    
    Multiplier_gamma_0 : Multiplier_gamma 
        Port map (  input_a => AD_s20,
                    input_b => gamma,
                    output => MULT_s 
                    );  
                    
    Exponential_0 : Exponential
        Port map (  input => MULT_s,
                    output => output
                    );
                    
end Behavioral;
