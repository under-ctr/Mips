----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/29/2021 10:31:25 PM
-- Design Name: 
-- Module Name: MainControl - Behavioral
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

entity MainControl is
      Port (    Instr : in std_logic_vector( 2 downto 0);
                RegDst : out std_logic;
                ExtOp : out std_logic;
                ALUSrc : out std_logic;
                Branch : out std_logic;
                Jump : out std_logic;
                ALUOp : out std_logic_vector(2 downto 0);
                MemWrite : out std_logic;
                MemtoReg : out std_logic;
                RegWrite : out std_logic
       );
end MainControl;

architecture Behavioral of MainControl is

begin
    RegDst <= '0'; ExtOp <= '0'; ALUSrc <= '0'; Branch <= '0';
    Jump <= '0'; 
    ALUOp <= "000";  
    MemWrite <= '0';
    RegWrite <= '0';
    MemtoReg<= '0';
    
    process(Instr) 
    begin
    case(Instr) is
       when "000" => -- R type
            RegDst <= '1';
            RegWrite <= '1';
            ALUOp <= "000";
       when  "001" => --ADDI
            ExtOp <= '1';
            ALUSrc <= '1';
            RegWrite <= '1';
            ALUOp <= "001";
       when "010" => --LW
             ExtOp <= '1';
             ALUSrc <= '1';
             MemtoReg <= '1';
             RegWrite <= '1';
             ALUOp <= "001";
       when "011" => --SW 
             ExtOp <= '1';
             ALUSrc <= '1';
             MemWrite <= '1';
             ALUOp <= "001";   
       when "100" => --BEQ
             ExtOp <='1';
             Branch <= '1';
             ALUOp <="010";
       when "101" => -- ANDI  aceasta este adaugata dupa, trebuie sa modific si pe caiet in loc de BNE
             ALUSrc <= '1';
             RegWrite <= '1';
             ALUOp <= "101";
       when "110" => --ORI 
            ALUSrc <= '1';
            RegWrite <= '1';
            ALUOp<="110";
       when "111" => --J
            Jump <= '1';
     when others => 
        RegDst <= 'X'; ExtOp <= 'X'; ALUSrc <= 'X'; Branch <= 'X';
        Jump <= 'X'; 
        ALUOp <= "XXX";  
        MemWrite <= 'X';
        RegWrite <= 'X';
        MemtoReg<= 'X';
      end case;   
    end process;

end Behavioral;
