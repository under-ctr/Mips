----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2021 07:33:01 PM
-- Design Name: 
-- Module Name: InstructionFetch - Behavioral
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

entity InstructionFetch is
    Port ( clk : in STD_LOGIC;
           reset : in std_logic;
           en : in std_logic;
           jump : in std_logic;
           PCsrc : in std_logic;
           jumpAdress :in std_logic_vector(15 downto 0);
           branchAdress : in std_logic_vector(15 downto 0);
           instr : out std_logic_vector(15 downto 0);
           instrNext : out std_logic_vector(15 downto 0)
           );
end InstructionFetch;

architecture Behavioral of InstructionFetch is


    type rom_type is array (0 to 255) of std_logic_vector(15 downto 0);
    signal ROM: rom_type :=(
       --aici am introdus ceea ce am realizat saptamana trecuta la laborator 
        b"000_000_000_001_0_000",
        b"001_000_100_0001010",
        b"000_000_000_010_0_000",
        b"001_000_101_1100100", --3
        b"010_001_100_0000111",
        b"011_010_011_0101000", --5
        b"001_011_011_0000001",
        b"100_010_011_0101000",--7
        b"000_101_011_101_0_001",
        b"001_010_010_0000010",--9
        b"001_001_001_0000001",
        b"101_0000000000100",
        b"100_000_101_0111100",
        others => X"0000");

signal adress : std_logic_vector(15 downto 0):=X"0000";
signal pcSignal : std_logic_vector(15 downto 0):=X"0000";
signal pcInter : std_logic_vector(15 downto 0):=X"0000"; -- pcinter
signal mux : std_logic_vector(15 downto 0):=X"0000"; --intermediate


begin
   --scrierea in memeorie 
    process(clk, reset, en)
    begin
        if reset = '1' then 
            adress <= X"0000";
        elsif en = '1' then
            if clk = '1' and clk'event then 
                adress <= pcSignal; 
            end if;
        end if;
        
    end process; 
    
    --adaugarea 1 in ALU si atribuirea semnalelor de iesire
    instr <= ROM(conv_integer(adress));
    pcInter <= adress +1; 
    instrNext <= pcInter;
    
    -- primul mux  
    process( pcInter, branchAdress, PCsrc)
    begin 
        if PCsrc = '1' then
            mux  <= branchAdress;
        else
            mux <= pcInter;
       end if;  
    
    end process;
    
    --al doilea mux 
    process (mux, jumpAdress, jump)
    begin 
        if jump = '1'  then 
            pcSignal <= jumpAdress;
        else 
            pcSignal <= mux;
        end if;
        
    end process;    

end Behavioral;
