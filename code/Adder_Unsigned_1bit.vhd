----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/08/23 21:32:16
-- Design Name: 
-- Module Name: Adder_Unsigned_1bit - Behavioral
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

entity Adder_Unsigned_1bit is
    Port (  carry_in : in std_logic;
            input_a : in std_logic;
            input_b : in std_logic;
            output : out std_logic;
            carry_out : out std_logic
             );
end Adder_Unsigned_1bit;

architecture Behavioral of Adder_Unsigned_1bit is

begin

    output <= input_a XOR input_b XOR carry_in ;
    carry_out <= (input_a AND input_b) OR (carry_in AND input_a) OR (carry_in AND input_b) ;

end Behavioral;
