----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:
-- Design Name: 
-- Module Name: Kernel_rbf_tb - Behavioral
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

entity Kernel_rbf_tb is
--  Port ( );
end Kernel_rbf_tb;

architecture Behavioral of Kernel_rbf_tb is

component Kernel_rbf is
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
end component;

signal SV_dim0_s : std_logic_vector(27 downto 0) := (others => '0');
signal SV_dim1_s : std_logic_vector(27 downto 0) := (others => '0');
signal SV_dim2_s : std_logic_vector(27 downto 0) := (others => '0');
signal SV_dim3_s : std_logic_vector(27 downto 0) := (others => '0');
signal SV_dim4_s : std_logic_vector(27 downto 0) := (others => '0');
signal SV_dim5_s : std_logic_vector(27 downto 0) := (others => '0');
signal SV_dim6_s : std_logic_vector(27 downto 0) := (others => '0');
signal SV_dim7_s : std_logic_vector(27 downto 0) := (others => '0');
signal test_data_dim0_s : std_logic_vector(27 downto 0) := (others => '0');
signal test_data_dim1_s : std_logic_vector(27 downto 0) := (others => '0');
signal test_data_dim2_s : std_logic_vector(27 downto 0) := (others => '0');
signal test_data_dim3_s : std_logic_vector(27 downto 0) := (others => '0');
signal test_data_dim4_s : std_logic_vector(27 downto 0) := (others => '0');
signal test_data_dim5_s : std_logic_vector(27 downto 0) := (others => '0');
signal test_data_dim6_s : std_logic_vector(27 downto 0) := (others => '0');
signal test_data_dim7_s : std_logic_vector(27 downto 0) := (others => '0');
signal gamma_s : std_logic_vector(11 downto 0) := x"58e";
signal output_s : std_logic_vector(10 downto 0);

begin

    Kernel_rbf_0 : Kernel_rbf
        port map (  SV_dim0 => SV_dim0_s,
                    SV_dim1 => SV_dim1_s,
                    SV_dim2 => SV_dim2_s,
                    SV_dim3 => SV_dim3_s,
                    SV_dim4 => SV_dim4_s,
                    SV_dim5 => SV_dim5_s,
                    SV_dim6 => SV_dim6_s,
                    SV_dim7 => SV_dim7_s,
                    test_data_dim0 => test_data_dim0_s,
                    test_data_dim1 => test_data_dim1_s,
                    test_data_dim2 => test_data_dim2_s,
                    test_data_dim3 => test_data_dim3_s,
                    test_data_dim4 => test_data_dim4_s,
                    test_data_dim5 => test_data_dim5_s,
                    test_data_dim6 => test_data_dim6_s,
                    test_data_dim7 => test_data_dim7_s,
                    gamma => gamma_s,
                    output => output_s
                    );

end Behavioral;
