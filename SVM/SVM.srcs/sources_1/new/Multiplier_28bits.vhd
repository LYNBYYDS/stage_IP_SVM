----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: Multiplier_28bits - Behavioral
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

entity Multiplier_28bits is
    Port (  input_a : in std_logic_vector(27 downto 0);     
            input_b : in std_logic_vector(27 downto 0);
            output : out std_logic_vector(44 downto 0)   
            );
end Multiplier_28bits;

architecture Behavioral of Multiplier_28bits is

signal sign : std_logic;
signal s_s0 : std_logic_vector(55 downto 0);            -- 28+28
signal s_s1 : std_logic_vector(55 downto 0);
signal s_s2 : std_logic_vector(55 downto 0);
signal s_s3 : std_logic_vector(55 downto 0);
signal s_s4 : std_logic_vector(55 downto 0);
signal s_s5 : std_logic_vector(55 downto 0);
signal s_s6 : std_logic_vector(55 downto 0);
signal s_s7 : std_logic_vector(55 downto 0);
signal s_s8 : std_logic_vector(55 downto 0);
signal s_s9 : std_logic_vector(55 downto 0);
signal s_s10 : std_logic_vector(55 downto 0);
signal s_s11 : std_logic_vector(55 downto 0);
signal s_s12 : std_logic_vector(55 downto 0);
signal s_s13 : std_logic_vector(55 downto 0);
signal s_s14 : std_logic_vector(55 downto 0);
signal s_s15 : std_logic_vector(55 downto 0);
signal s_s16 : std_logic_vector(55 downto 0);
signal s_s17 : std_logic_vector(55 downto 0);
signal s_s18 : std_logic_vector(55 downto 0);
signal s_s19 : std_logic_vector(55 downto 0);
signal s_s20 : std_logic_vector(55 downto 0);
signal s_s21 : std_logic_vector(55 downto 0);
signal s_s22 : std_logic_vector(55 downto 0);
signal s_s23 : std_logic_vector(55 downto 0);
signal s_s24 : std_logic_vector(55 downto 0);
signal s_s25 : std_logic_vector(55 downto 0);
signal s_s26 : std_logic_vector(55 downto 0);
signal s_s27 : std_logic_vector(55 downto 0);

begin

sign <= '0' when input_a(17) = input_b(17) else
        '1';
        
s_s0 <= input_a(27 downto 0) when input_b(0) = '1';
s_s1 <= s_s0 + input_a(27 downto 0) & '0' when input_b(1) = '1';
s_s2 <= s_s1 + input_a(27 downto 0) & "00" when input_b(2) = '1';
s_s3 <= s_s2 + input_a(27 downto 0) & "000" when input_b(3) = '1';
s_s4 <= s_s3 + input_a(27 downto 0) & x"0" when input_b(4) = '1';
s_s5 <= s_s4 + input_a(27 downto 0) & '0' & x"0" when input_b(5) = '1';
s_s6 <= s_s5 + input_a(27 downto 0) & "00" & x"0" when input_b(6) = '1';
s_s7 <= s_s6 + input_a(27 downto 0) & "000" & x"0" when input_b(7) = '1';
s_s8 <= s_s7 + input_a(27 downto 0) & x"00" when input_b(8) = '1';
s_s9 <= s_s8 + input_a(27 downto 0) & '0' & x"00" when input_b(9) = '1';
s_s10 <= s_s9 + input_a(27 downto 0) & "00" & x"00" when input_b(10) = '1';
s_s11 <= s_s10 + input_a(27 downto 0) & "000" & x"00" when input_b(11) = '1';
s_s12 <= s_s11 + input_a(27 downto 0) & x"000" when input_b(12) = '1';
s_s13 <= s_s12 + input_a(27 downto 0) & '0' & x"000" when input_b(13) = '1';
s_s14 <= s_s13 + input_a(27 downto 0) & "00" & x"000" when input_b(14) = '1';
s_s15 <= s_s14 + input_a(27 downto 0) & "000" & x"000" when input_b(15) = '1';
s_s16 <= s_s15 + input_a(27 downto 0) & x"0000" when input_b(16) = '1';
s_s17 <= s_s16 + input_a(27 downto 0) & '0' & x"0000" when input_b(17) = '1';
s_s18 <= s_s17 + input_a(27 downto 0) & "00" & x"0000" when input_b(18) = '1';
s_s19 <= s_s18 + input_a(27 downto 0) & "000" & x"0000" when input_b(19) = '1';
s_s20 <= s_s19 + input_a(27 downto 0) & x"00000" when input_b(20) = '1';
s_s21 <= s_s20 + input_a(27 downto 0) & '0' & x"00000" when input_b(21) = '1';
s_s22 <= s_s21 + input_a(27 downto 0) & "00" & x"00000" when input_b(22) = '1';
s_s23 <= s_s22 + input_a(27 downto 0) & "000" & x"00000" when input_b(23) = '1';
s_s24 <= s_s23 + input_a(27 downto 0) & x"000000" when input_b(24) = '1';
s_s25 <= s_s24 + input_a(27 downto 0) & '0' & x"000000" when input_b(25) = '1';
s_s26 <= s_s25 + input_a(27 downto 0) & "00" & x"000000" when input_b(26) = '1';
s_s27 <= s_s26 + input_a(27 downto 0) & "000" & x"000000" when input_b(27) = '1';

output <= s_s27(55 downto 11);

end Behavioral;
