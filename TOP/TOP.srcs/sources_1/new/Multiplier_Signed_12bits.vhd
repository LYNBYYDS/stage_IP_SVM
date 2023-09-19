----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: Multiplier_Signed_12bits - Behavioral
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

entity Multiplier_Signed_12bits is
    Port (  input_a : in std_logic_vector(11 downto 0);     
            input_b : in std_logic_vector(11 downto 0);
            output : out std_logic_vector(12 downto 0)  -- (SIGNED)2bit.10bits * (SIGNED)2bit.10bits = (SIGNED)3bits.10bits
            );
end Multiplier_Signed_12bits;

architecture Behavioral of Multiplier_Signed_12bits is

signal input_a_ca2 : std_logic_vector(11 downto 0);
signal input_b_ca2 : std_logic_vector(11 downto 0);

component Twos_Complement_Inv_12bits is
    Port (  input : in std_logic_vector(11 downto 0);
            output : out std_logic_vector(11 downto 0)
            );
end component;

component Multiplier_12bits is      -- Unsigned Multiplier
    Port (  input_a : in std_logic_vector(11 downto 0);     
            input_b : in std_logic_vector(11 downto 0);
            output : out std_logic_vector(13 downto 0)  
            );
end component;

component Twos_Complement_13bits is
    Port (  input : in std_logic_vector(12 downto 0);
            output : out std_logic_vector(12 downto 0)  
            );
end component;

signal output_sign_s : std_logic;
signal output_s : std_logic_vector(13 downto 0);
signal output_ca2_s : std_logic_vector(12 downto 0);

begin

output_sign_s <=    '0' when input_a(11) = input_b(11) else 
                    '1';
                    
    Twos_Complement_Inv_12bits_a : Twos_Complement_Inv_12bits
        port map (  input => input_a,   
                    output => input_a_ca2
                    );
                    
    Twos_Complement_Inv_12bits_b : Twos_Complement_Inv_12bits
        port map (  input => input_b,   
                    output => input_b_ca2
                    );

    Multiplier_12bits_0 : Multiplier_12bits
        port map (  input_a => input_a_ca2,   
                    input_b => input_b_ca2,
                    output => output_s
                    ); 

    Twos_Complement_13bits_0 : Twos_Complement_13bits
        port map (  input => output_s(12 downto 0),   
                    output => output_ca2_s
                    ); 
                    
    output <= output_ca2_s when output_sign_s = '1' else 
                output_s(12 downto 0);
    
end Behavioral;
