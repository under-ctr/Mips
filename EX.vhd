----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/05/2021 09:33:21 PM
-- Design Name: 
-- Module Name: EX - Behavioral
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

entity EX is
     Port (   
               RD1 : in STD_LOGIC_VECTOR (15 downto 0);
               ALUsrc : in STD_LOGIC;
               RD2 : in STD_LOGIC_VECTOR (15 downto 0);
               ExtImm : in STD_LOGIC_VECTOR (15 downto 0);
               sa : in STD_LOGIC;
               func : in STD_LOGIC_VECTOR (2 downto 0);
               ALUOp : in STD_LOGIC_VECTOR(2 downto 0);
               PC : in STD_LOGIC_VECTOR(15 downto 0);
               ALURes : out STD_LOGIC_VECTOR(15 downto 0);
               BranchAddr : out STD_LOGIC_VECTOR(15 downto 0);
               zero : out STD_LOGIC
         );
end EX;

architecture Behavioral of EX is

signal Mux : STD_LOGIC_VECTOR(15 downto 0);
signal SigAluOut : STD_LOGIC_VECTOR(15 downto 0);
signal AluCtrl: STD_LOGIC_VECTOR(2 downto 0);
signal shiftr: STD_LOGIC_VECTOR(15 downto 0);
signal shiftl: STD_LOGIC_VECTOR(15 downto 0);

begin
 Mux <= RD2 when AluSrc = '0' else ExtImm;
 BranchAddr <= PC + ExtImm;-- nu sunt sigur ca branchaddr esgte calculat bine 
 process(ALUOp, func)
 begin
  case ALUOp is
      when "000" => 
         case func is
              when "000" => ALUCtrl <= "000"; -- ADD
              when "001" => ALUCtrl <= "001"; -- SUB
              when "010" => ALUCtrl <= "010"; -- SLL
              when "011" => ALUCtrl <= "011"; -- SRL
              when "100" => ALUCtrl <= "100"; -- AND
              when "101" => ALUCtrl <= "101"; -- OR
              when "110" => ALUCtrl <= "110"; -- XOR
              when "111" => ALUCtrl <= "111"; -- NAND
          end case;
      --when "001" => ALUCtrl <= "000"; -- addi
      --when "010" => ALUCtrl <= "000"; -- lw
      --when "011" => ALUCtrl <= "000"; -- sw
      --when "100" => ALUCtrl <= "001"; -- beq
      --when "101" => ALUCtrl <= "001"; -- bne
      --when "110" => ALUCtrl <= "101"; -- ori
      --when "111" => ALUCtrl <= "000"; -- jmp
      when "001" => ALUCtrl <= "000"; -- +
      when "010" => ALUCtrl <= "001"; -- -
      when "101" => ALUCtrl <= "100"; -- &
      when "110" => ALUCtrl <= "101"; -- |
      when others => ALUCtrl <= (others => '0'); -- unknown
      
   end case;
end process;

process(sa)
begin
   if sa = '1' then 
        shiftl <= Mux(14 downto 0) & "0";
   else  shiftl <= Mux;
   end if; 
end process;
              
 process(sa)
 begin
 if sa = '1' then 
    shiftr <= "0" & Mux(15 downto 1);
 else shiftr <= Mux;
 end if;
 end process;
                                    
                
                
 process(ALUCtrl, RD1, Mux, sa)
  begin
  case ALUCtrl  is
        when "000" => SigAluOut <= RD1 + Mux;-- ADD
        when "001" => SigAluOut <= RD1 - Mux; -- SUB
        when "010" => SigAluOut <= shiftl;        -- SLL                        
        when "011" => SigAluOut <= shiftr;        -- SRL
        when "100" => SigAluOut <= RD1 and Mux; -- AND    
        when "101" => SigAluOut <=RD1 or Mux;    -- OR
        when "110" => SigAluOut <=RD1 xor Mux;      --XOR    
        when "111" => SigAluOut <=RD1 nand Mux;  -- NAND        
  end case;
                  
                        
  case SigAluOut is
       when x"0000" => Zero <= '1';
       when others => Zero <= '0';
  end case;
 end process;
                    
ALURes <= SigAluOut;


end Behavioral;
