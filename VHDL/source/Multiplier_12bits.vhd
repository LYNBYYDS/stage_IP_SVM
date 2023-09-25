----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:
-- Design Name: 
-- Module Name: Multiplier_12bits - Behavioral
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

entity Multiplier_12bits is
    Port (  input_a : in std_logic_vector(11 downto 0);     
            input_b : in std_logic_vector(11 downto 0);
            output : out std_logic_vector(13 downto 0)  
            );
end Multiplier_12bits;

architecture Behavioral of Multiplier_12bits is

signal s_s0 : std_logic_vector(23 downto 0);
signal s_s1 : std_logic_vector(23 downto 0);
signal s_s2 : std_logic_vector(23 downto 0);
signal s_s3 : std_logic_vector(23 downto 0);
signal s_s4 : std_logic_vector(23 downto 0);
signal s_s5 : std_logic_vector(23 downto 0);
signal s_s6 : std_logic_vector(23 downto 0);
signal s_s7 : std_logic_vector(23 downto 0);
signal s_s8 : std_logic_vector(23 downto 0);
signal s_s9 : std_logic_vector(23 downto 0);
signal s_s10 : std_logic_vector(23 downto 0);
signal s_s11 : std_logic_vector(23 downto 0);

component Adder_Unsigned_24bits is 
    Port (  carry_in : in std_logic;
            input_a : in std_logic_vector(23 downto 0);
            input_b : in std_logic_vector(23 downto 0);
            output : out std_logic_vector(23 downto 0);
            carry_out : out std_logic
            );
end component;

signal output_s0 : std_logic_vector(23 downto 0);
signal output_s1 : std_logic_vector(23 downto 0);
signal output_s2 : std_logic_vector(23 downto 0);
signal output_s3 : std_logic_vector(23 downto 0);
signal output_s4 : std_logic_vector(23 downto 0);
signal output_s5 : std_logic_vector(23 downto 0);
signal output_s6 : std_logic_vector(23 downto 0);
signal output_s7 : std_logic_vector(23 downto 0);
signal output_s8 : std_logic_vector(23 downto 0);
signal output_s9 : std_logic_vector(23 downto 0);
signal output_s10 : std_logic_vector(23 downto 0);

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

begin

    s_s0 <= x"000"&input_a when input_b(0) = '1' else 
            x"000000";
    s_s1 <= x"00"&"000"&input_a&'0' when input_b(1) = '1' else 
            x"000000";
    s_s2 <= x"00"&"00"&input_a&"00" when input_b(2) = '1' else 
            x"000000";
    s_s3 <= x"00"&'0'&input_a&"000" when input_b(3) = '1' else
            x"000000";
    s_s4 <= x"00"&input_a&x"0" when input_b(4) = '1' else 
            x"000000";
    s_s5 <= x"0"&"000"&input_a&'0'&x"0" when input_b(5) = '1' else 
            x"000000";
    s_s6 <= x"0"&"00"&input_a&"00"&x"0" when input_b(6) = '1' else 
            x"000000";
    s_s7 <= x"0"&'0'&input_a&"000"&x"0" when input_b(7) = '1' else 
            x"000000";
    s_s8 <= x"0"&input_a&x"00" when input_b(8) = '1' else 
            x"000000";
    s_s9 <= "000"&input_a&'0'&x"00" when input_b(9) = '1' else 
            x"000000";
    s_s10 <="00"&input_a&"00"&x"00" when input_b(10) = '1' else 
            x"000000";
    s_s11 <="0"&input_a&"000"&x"00" when input_b(11) = '1' else 
            x"000000";
    
    Adder_Unsigned_24bits_0 : Adder_Unsigned_24bits
        port map (  carry_in => '0',
                    input_a => s_s0,
                    input_b => s_s1,
                    output => output_s0,
                    carry_out => carry_out_s0
                    );   
                    
    Adder_Unsigned_24bits_1 : Adder_Unsigned_24bits
        port map (  carry_in => '0',
                    input_a => output_s0,
                    input_b => s_s2,
                    output => output_s1,
                    carry_out => carry_out_s1
                    );   
                    
    Adder_Unsigned_24bits_2 : Adder_Unsigned_24bits
        port map (  carry_in => '0',
                    input_a => output_s1,
                    input_b => s_s3,
                    output => output_s2,
                    carry_out => carry_out_s2
                    );   
                    
    Adder_Unsigned_24bits_3 : Adder_Unsigned_24bits
        port map (  carry_in => '0',
                    input_a => output_s2,
                    input_b => s_s4,
                    output => output_s3,
                    carry_out => carry_out_s3
                    );   
                    
    Adder_Unsigned_24bits_4 : Adder_Unsigned_24bits
        port map (  carry_in => '0',
                    input_a => output_s3,
                    input_b => s_s5,
                    output => output_s4,
                    carry_out => carry_out_s4
                    );   
                    
    Adder_Unsigned_24bits_5 : Adder_Unsigned_24bits
        port map (  carry_in => '0',
                    input_a => output_s4,
                    input_b => s_s6,
                    output => output_s5,
                    carry_out => carry_out_s5
                    );   
                    
    Adder_Unsigned_24bits_6 : Adder_Unsigned_24bits
        port map (  carry_in => '0',
                    input_a => output_s5,
                    input_b => s_s7,
                    output => output_s6,
                    carry_out => carry_out_s6
                    );   
                    
    Adder_Unsigned_24bits_7 : Adder_Unsigned_24bits
        port map (  carry_in => '0',
                    input_a => output_s6,
                    input_b => s_s8,
                    output => output_s7,
                    carry_out => carry_out_s7
                    );   
                    
    Adder_Unsigned_24bits_8 : Adder_Unsigned_24bits
        port map (  carry_in => '0',
                    input_a => output_s7,
                    input_b => s_s9,
                    output => output_s8,
                    carry_out => carry_out_s8
                    );   
                    
    Adder_Unsigned_24bits_9 : Adder_Unsigned_24bits
        port map (  carry_in => '0',
                    input_a => output_s8,
                    input_b => s_s10,
                    output => output_s9,
                    carry_out => carry_out_s9
                    );   
                    
    Adder_Unsigned_24bits_10 : Adder_Unsigned_24bits
        port map (  carry_in => '0',
                    input_a => output_s9,
                    input_b => s_s11,
                    output => output_s10,
                    carry_out => carry_out_s10
                    );   
                    
    output <= output_s10(23 downto 10);

end Behavioral;
