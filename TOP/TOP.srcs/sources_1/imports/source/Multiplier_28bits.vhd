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
            output : out std_logic_vector(55 downto 0)  
            );
end Multiplier_28bits;

architecture Behavioral of Multiplier_28bits is

signal s_s0 : std_logic_vector(55 downto 0);
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

component Adder_Unsigned_56bits is 
    Port (  carry_in : in std_logic;
            input_a : in std_logic_vector(55 downto 0);
            input_b : in std_logic_vector(55 downto 0);
            output : out std_logic_vector(55 downto 0);
            carry_out : out std_logic
            );
end component;

signal output_s0 : std_logic_vector(55 downto 0);
signal output_s1 : std_logic_vector(55 downto 0);
signal output_s2 : std_logic_vector(55 downto 0);
signal output_s3 : std_logic_vector(55 downto 0);
signal output_s4 : std_logic_vector(55 downto 0);
signal output_s5 : std_logic_vector(55 downto 0);
signal output_s6 : std_logic_vector(55 downto 0);
signal output_s7 : std_logic_vector(55 downto 0);
signal output_s8 : std_logic_vector(55 downto 0);
signal output_s9 : std_logic_vector(55 downto 0);
signal output_s10 : std_logic_vector(55 downto 0);
signal output_s11 : std_logic_vector(55 downto 0);
signal output_s12 : std_logic_vector(55 downto 0);
signal output_s13 : std_logic_vector(55 downto 0);
signal output_s14 : std_logic_vector(55 downto 0);
signal output_s15 : std_logic_vector(55 downto 0);
signal output_s16 : std_logic_vector(55 downto 0);
signal output_s17 : std_logic_vector(55 downto 0);
signal output_s18 : std_logic_vector(55 downto 0);
signal output_s19 : std_logic_vector(55 downto 0);
signal output_s20 : std_logic_vector(55 downto 0);
signal output_s21 : std_logic_vector(55 downto 0);
signal output_s22 : std_logic_vector(55 downto 0);
signal output_s23 : std_logic_vector(55 downto 0);
signal output_s24 : std_logic_vector(55 downto 0);
signal output_s25 : std_logic_vector(55 downto 0);
signal output_s26 : std_logic_vector(55 downto 0);
signal carry_out_s0 :  std_logic;
signal carry_out_s1 :  std_logic;
signal carry_out_s2 :  std_logic;
signal carry_out_s3 :  std_logic;
signal carry_out_s4 :  std_logic;
signal carry_out_s5 :  std_logic;
signal carry_out_s6 :  std_logic;
signal carry_out_s7 :  std_logic;
signal carry_out_s8 :  std_logic;
signal carry_out_s9 :  std_logic;
signal carry_out_s10 :  std_logic;
signal carry_out_s11 :  std_logic;
signal carry_out_s12 :  std_logic;
signal carry_out_s13 :  std_logic;
signal carry_out_s14 :  std_logic;
signal carry_out_s15 :  std_logic;
signal carry_out_s16 :  std_logic;
signal carry_out_s17 :  std_logic;
signal carry_out_s18 :  std_logic;
signal carry_out_s19 :  std_logic;
signal carry_out_s20 :  std_logic;
signal carry_out_s21 :  std_logic;
signal carry_out_s22 :  std_logic;
signal carry_out_s23 :  std_logic;
signal carry_out_s24 :  std_logic;
signal carry_out_s25 :  std_logic;
signal carry_out_s26 :  std_logic;

begin

    s_s0 <= x"0000000"&input_a(27 downto 0) when input_b(0) = '1' else 
            x"00000000000000";
    s_s1 <= x"000000"&"000"&input_a(27 downto 0)&'0' when input_b(1) = '1' else 
            x"00000000000000";
    s_s2 <= x"000000"&"00"&input_a(27 downto 0)&"00" when input_b(2) = '1' else 
            x"00000000000000";
    s_s3 <= x"000000"&'0'&input_a(27 downto 0)&"000" when input_b(3) = '1' else 
            x"00000000000000";
    s_s4 <= x"000000"&input_a(27 downto 0)&x"0" when input_b(4) = '1' else 
            x"00000000000000";
    s_s5 <= x"00000"&"000"&input_a(27 downto 0)&'0'&x"0" when input_b(5) = '1' else 
            x"00000000000000";
    s_s6 <= x"00000"&"00"&input_a(27 downto 0)&"00"&x"0" when input_b(6) = '1' else 
            x"00000000000000";
    s_s7 <= x"00000"&'0'&input_a(27 downto 0)&"000"&x"0" when input_b(7) = '1' else 
            x"00000000000000";
    s_s8 <= x"00000"&input_a(27 downto 0)&x"00" when input_b(8) = '1' else 
            x"00000000000000";
    s_s9 <= x"0000"&"000"&input_a(27 downto 0)&'0'&x"00" when input_b(9) = '1' else 
            x"00000000000000";
    s_s10 <= x"0000"&"00"&input_a(27 downto 0)&"00"&x"00" when input_b(10) = '1' else 
            x"00000000000000";
    s_s11 <= x"0000"&'0'&input_a(27 downto 0)&"000"&x"00" when input_b(11) = '1' else 
            x"00000000000000";
    s_s12 <= x"0000"&input_a(27 downto 0)&x"000" when input_b(12) = '1' else 
            x"00000000000000";
    s_s13 <= x"000"&"000"&input_a(27 downto 0)&'0'&x"000" when input_b(13) = '1' else 
            x"00000000000000";
    s_s14 <= x"000"&"00"&input_a(27 downto 0)&"00"&x"000" when input_b(14) = '1' else 
            x"00000000000000";
    s_s15 <= x"000"&'0'&input_a(27 downto 0)&"000"&x"000" when input_b(15) = '1' else 
            x"00000000000000";
    s_s16 <= x"000"&input_a(27 downto 0)&x"0000" when input_b(16) = '1' else 
            x"00000000000000";
    s_s17 <= x"00"&"000"&input_a(27 downto 0)&'0'&x"0000" when input_b(17) = '1' else 
            x"00000000000000";
    s_s18 <= x"00"&"00"&input_a(27 downto 0)&"00"&x"0000" when input_b(18) = '1' else 
            x"00000000000000";
    s_s19 <= x"00"&'0'&input_a(27 downto 0)&"000"&x"0000" when input_b(19) = '1' else 
            x"00000000000000";
    s_s20 <= x"00"&input_a(27 downto 0)&x"00000" when input_b(20) = '1' else 
            x"00000000000000";
    s_s21 <= x"0"&"000"&input_a(27 downto 0)&'0'&x"00000" when input_b(21) = '1' else 
            x"00000000000000";
    s_s22 <= x"0"&"00"&input_a(27 downto 0)&"00"&x"00000" when input_b(22) = '1' else 
            x"00000000000000";
    s_s23 <= x"0"&'0'&input_a(27 downto 0)&"000"&x"00000" when input_b(23) = '1' else 
            x"00000000000000";
    s_s24 <= x"0"&input_a(27 downto 0)&x"000000" when input_b(24) = '1' else 
            x"00000000000000";
    s_s25 <= "000"&input_a(27 downto 0)&'0'&x"000000" when input_b(25) = '1' else 
            x"00000000000000";
    s_s26 <= "00"&input_a(27 downto 0)&"00"&x"000000" when input_b(26) = '1' else 
            x"00000000000000";
    s_s27 <= '0'&input_a(27 downto 0)&"000"&x"000000" when input_b(27) = '1' else 
            x"00000000000000";
        
    Adder_Unsigned_56bits_0 : Adder_Unsigned_56bits
        port map (  carry_in => '0',
                    input_a => s_s0,
                    input_b => s_s1,
                    output => output_s0,
                    carry_out => carry_out_s0
                    );   
                    
    Adder_Unsigned_56bits_1 : Adder_Unsigned_56bits
        port map (  carry_in => '0',
                    input_a => output_s0,
                    input_b => s_s2,
                    output => output_s1,
                    carry_out => carry_out_s1
                    );   
                    
    Adder_Unsigned_56bits_2 : Adder_Unsigned_56bits
        port map (  carry_in => '0',
                    input_a => output_s1,
                    input_b => s_s3,
                    output => output_s2,
                    carry_out => carry_out_s2
                    );   
                    
    Adder_Unsigned_56bits_3 : Adder_Unsigned_56bits
        port map (  carry_in => '0',
                    input_a => output_s2,
                    input_b => s_s4,
                    output => output_s3,
                    carry_out => carry_out_s3
                    );   
                    
    Adder_Unsigned_56bits_4 : Adder_Unsigned_56bits
        port map (  carry_in => '0',
                    input_a => output_s3,
                    input_b => s_s5,
                    output => output_s4,
                    carry_out => carry_out_s4
                    );   
                    
    Adder_Unsigned_56bits_5 : Adder_Unsigned_56bits
        port map (  carry_in => '0',
                    input_a => output_s4,
                    input_b => s_s6,
                    output => output_s5,
                    carry_out => carry_out_s5
                    );   
                    
    Adder_Unsigned_56bits_6 : Adder_Unsigned_56bits
        port map (  carry_in => '0',
                    input_a => output_s5,
                    input_b => s_s7,
                    output => output_s6,
                    carry_out => carry_out_s6
                    );   
                    
    Adder_Unsigned_56bits_7 : Adder_Unsigned_56bits
        port map (  carry_in => '0',
                    input_a => output_s6,
                    input_b => s_s8,
                    output => output_s7,
                    carry_out => carry_out_s7
                    );   
                    
    Adder_Unsigned_56bits_8 : Adder_Unsigned_56bits
        port map (  carry_in => '0',
                    input_a => output_s7,
                    input_b => s_s9,
                    output => output_s8,
                    carry_out => carry_out_s8
                    );   
                    
    Adder_Unsigned_56bits_9 : Adder_Unsigned_56bits
        port map (  carry_in => '0',
                    input_a => output_s8,
                    input_b => s_s10,
                    output => output_s9,
                    carry_out => carry_out_s9
                    );   
                    
    Adder_Unsigned_56bits_10 : Adder_Unsigned_56bits
        port map (  carry_in => '0',
                    input_a => output_s9,
                    input_b => s_s11,
                    output => output_s10,
                    carry_out => carry_out_s10
                    );   
                    
    Adder_Unsigned_56bits_11 : Adder_Unsigned_56bits
        port map (  carry_in => '0',
                    input_a => output_s10,
                    input_b => s_s12,
                    output => output_s11,
                    carry_out => carry_out_s11
                    );   
                    
    Adder_Unsigned_56bits_12 : Adder_Unsigned_56bits
        port map (  carry_in => '0',
                    input_a => output_s11,
                    input_b => s_s13,
                    output => output_s12,
                    carry_out => carry_out_s12
                    );   
                    
    Adder_Unsigned_56bits_13 : Adder_Unsigned_56bits
        port map (  carry_in => '0',
                    input_a => output_s12,
                    input_b => s_s14,
                    output => output_s13,
                    carry_out => carry_out_s13
                    );   
                    
    Adder_Unsigned_56bits_14 : Adder_Unsigned_56bits
        port map (  carry_in => '0',
                    input_a => output_s13,
                    input_b => s_s15,
                    output => output_s14,
                    carry_out => carry_out_s14
                    );   
                    
    Adder_Unsigned_56bits_15 : Adder_Unsigned_56bits
        port map (  carry_in => '0',
                    input_a => output_s14,
                    input_b => s_s16,
                    output => output_s15,
                    carry_out => carry_out_s15
                    );   
                    
    Adder_Unsigned_56bits_16 : Adder_Unsigned_56bits
        port map (  carry_in => '0',
                    input_a => output_s15,
                    input_b => s_s17,
                    output => output_s16,
                    carry_out => carry_out_s16
                    );   
                    
    Adder_Unsigned_56bits_17 : Adder_Unsigned_56bits
        port map (  carry_in => '0',
                    input_a => output_s16,
                    input_b => s_s18,
                    output => output_s17,
                    carry_out => carry_out_s17
                    );   
                    
    Adder_Unsigned_56bits_18 : Adder_Unsigned_56bits
        port map (  carry_in => '0',
                    input_a => output_s17,
                    input_b => s_s19,
                    output => output_s18,
                    carry_out => carry_out_s18
                    );   
                    
    Adder_Unsigned_56bits_19 : Adder_Unsigned_56bits
        port map (  carry_in => '0',
                    input_a => output_s18,
                    input_b => s_s20,
                    output => output_s19,
                    carry_out => carry_out_s19
                    );   
                    
    Adder_Unsigned_56bits_20 : Adder_Unsigned_56bits
        port map (  carry_in => '0',
                    input_a => output_s19,
                    input_b => s_s21,
                    output => output_s20,
                    carry_out => carry_out_s20
                    );   
                    
    Adder_Unsigned_56bits_21 : Adder_Unsigned_56bits
        port map (  carry_in => '0',
                    input_a => output_s20,
                    input_b => s_s22,
                    output => output_s21,
                    carry_out => carry_out_s21
                    );   
                    
    Adder_Unsigned_56bits_22 : Adder_Unsigned_56bits
        port map (  carry_in => '0',
                    input_a => output_s21,
                    input_b => s_s23,
                    output => output_s22,
                    carry_out => carry_out_s22
                    );   
                    
    Adder_Unsigned_56bits_23 : Adder_Unsigned_56bits
        port map (  carry_in => '0',
                    input_a => output_s22,
                    input_b => s_s24,
                    output => output_s23,
                    carry_out => carry_out_s23
                    );   
                    
    Adder_Unsigned_56bits_24 : Adder_Unsigned_56bits
        port map (  carry_in => '0',
                    input_a => output_s23,
                    input_b => s_s25,
                    output => output_s24,
                    carry_out => carry_out_s24
                    );   
                    
    Adder_Unsigned_56bits_25 : Adder_Unsigned_56bits
        port map (  carry_in => '0',
                    input_a => output_s24,
                    input_b => s_s26,
                    output => output_s25,
                    carry_out => carry_out_s25
                    );   
                    
    Adder_Unsigned_56bits_26 : Adder_Unsigned_56bits
        port map (  carry_in => '0',
                    input_a => output_s25,
                    input_b => s_s27,
                    output => output_s26,
                    carry_out => carry_out_s26
                    );  
                        
    output <= output_s26;

end Behavioral;
