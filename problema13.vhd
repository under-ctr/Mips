----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/22/2021 08:38:19 PM
-- Design Name: 
-- Module Name: problema13 - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity problema13 is
    Port ( clk : in STD_LOGIC;
           enable : out STD_LOGIC;
           btn : in STD_LOGIC);
end problema13;

architecture Behavioral of problema13 is

signal numarator1 : STD_LOGIC_VECTOR( 15 downto 0) := "0000000000000000"; 
signal Q1 : STD_LOGIC;
signal Q2 : STD_LOGIC;
signal Q3 : STD_LOGIC;
begin
    process(clk)
    begin
        if clk = '1' and clk'event then
            numarator1 <= numarator1 + 1;
        end if;
    end process;
    
    process(clk)
    begin
        if clk = '1' and clk'event then
            if numarator1 = "1111111111111111" then
                Q1 <= btn;
            end if;
        end if;
    end process;
    
    process(clk)
    begin
        if clk = '1' and clk'event then
            Q2 <= Q1;
            Q3 <= Q2;
        end if;
    end process;
enable <= (not Q3) and Q2;
end Behavioral;
