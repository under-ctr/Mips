----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/08/2021 08:09:56 PM
-- Design Name: 
-- Module Name: REG_FILE - Behavioral
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

entity REG_FILE is
    Port ( clk : in STD_LOGIC;
    RegWr : in std_logic;
    RD1 : out std_logic_vector(15 downto 0);
    RD2 : out std_logic_vector(15 downto 0);
    RA1 : in std_logic_vector(2 downto 0);
    RA2 : in std_logic_vector(2 downto 0);
    WD : in std_logic_vector(15 downto 0); 
    WA : in std_logic_vector(2 downto 0));
  
         
end REG_FILE;

architecture Behavioral of REG_FILE is
type reg_array is array (0 to 15) of std_logic_vector (15 downto 0);
signal mem : reg_array :=(
    "1110000001111111",
    "1011111011101111",
    "0111011010110111",
    others=> x"0000"
);

begin


    RD1<=mem(conv_integer(RA1));
    RD2<=mem(conv_integer(RA2));

process(clk,RegWr) 
    begin
    if rising_edge(clk) and RegWr='1' then 
             mem(conv_integer(WA))<=WD;
    end if;
end process;

end Behavioral;
