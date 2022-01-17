----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/05/2021 10:48:37 PM
-- Design Name: 
-- Module Name: MEM - Behavioral
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

entity MEM is
    Port (clk : in std_logic;
    MemWrite : in std_logic;
    en : in std_logic;
    DataIn : in std_logic_vector(15 downto 0); --ALURes  in 
    RD2 : in std_logic_vector(15 downto 0);
    MemData : out std_logic_vector(15 downto 0); 
    ALURes : out std_logic_vector(15 downto 0));
end MEM;

architecture Behavioral of MEM is
type ram_array is array (0 to 31) of std_logic_vector(15 downto 0);
signal ram: ram_array := ( x"0000", 
    others => x"0000");
begin
    process(clk) 
    begin  
        if clk'event and clk = '1' then
            if en = '1' and MemWrite ='1'then 
                ram(conv_integer(DataIn(4 downto 0))) <= RD2;
            end if;
        end if;
   end process;     
MemData <= ram(conv_integer(DataIn(4 downto 0)));
ALURes <= DataIn;
end Behavioral;
