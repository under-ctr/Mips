----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/29/2021 06:34:18 PM
-- Design Name: 
-- Module Name: ID - Behavioral
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

entity ID is
     Port (clk: in std_logic;
            instr : in STD_LOGIC_VECTOR (15 downto 0);
               wd : inout STD_LOGIC_VECTOR (15 downto 0);
               RegWrite : in STD_LOGIC;
               RegDst : in STD_LOGIC;
               ExtOp : in STD_LOGIC;
               RD1 : out STD_LOGIC_VECTOR (15 downto 0);
               RD2 : out STD_LOGIC_VECTOR (15 downto 0);
               ExtImm : out STD_LOGIC_VECTOR (15 downto 0);
               func : out STD_LOGIC_VECTOR (2 downto 0);
               sa : out STD_LOGIC;
               WriteEn : in STD_LOGIC
             );
end ID;

architecture Behavioral of ID is
component REG_FILE is
    Port ( clk : in STD_LOGIC;
    RegWr : in std_logic;
    RD1 : out std_logic_vector(15 downto 0);
    RD2 : out std_logic_vector(15 downto 0);
    RA1 : in std_logic_vector(2 downto 0);
    RA2 : in std_logic_vector(2 downto 0);
    WD : in std_logic_vector(15 downto 0); 
    WA : in std_logic_vector(2 downto 0));
         
end component;


signal wa:std_logic_vector(2 downto 0);
begin
process(RegDst)
 begin
    if RegDst='0' then
       wa <= instr(9 downto 7);
    else 
        wa<= instr(6 downto 4);
  end if;
end process;
    
process(ExtOp)
begin
if ExtOp='0' then
   ExtImm<="000000000" & instr(6 downto 0);
    else
    if instr(6)='0' then
        ExtImm<="000000000" & instr(6 downto 0);
    else
        ExtImm<="111111111" & instr(6 downto 0);
    end if;
end if;
end process;
func<=instr(2 downto 0);
sa<= instr(3);

rf : REG_FILE port map (clk,RegWrite,RD1,RD2,instr(12 downto 10) , instr(9 downto 7), wd, wa);
end Behavioral;
