----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/22/2021 06:30:09 PM
-- Design Name: 
-- Module Name: test_env - Behavioral
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

--entitatea de la laboratoarele 1 si 2 
entity test_env is
    Port ( clk : in STD_LOGIC; 
           btn : in STD_LOGIC_VECTOR (4 downto 0);
           sw : in STD_LOGIC_VECTOR (15 downto 0);
           led : out STD_LOGIC_VECTOR (15 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           cat : out STD_LOGIC_VECTOR (6 downto 0) 
            );
end test_env;



architecture Behavioral of test_env is
--de la laboratorul 1 
-- signal leduri : STD_LOGIC_VECTOR(15 downto 0):="0000000000000000"; --leduri = count 
-- signal enable_e : STD_LOGIC;

--de la ual laborator 2
--signal sig1: STD_LOGIC_VECTOR(15 downto 0):=x"0000";
--signal sig2: STD_LOGIC_VECTOR(15 downto 0):=x"0000";
--signal sig3: STD_LOGIC_VECTOR(15 downto 0):=x"0000";
--signal numarator2b : STD_LOGIC_VECTOR (1 downto 0) := "00";

--ROM laborator 3 
--signal a: std_logic_vector(15 downto 0):=(others=>'0');
--signal cnt: std_logic_vector(7 downto 0) :=(others=>'0');
--signal enable_e : STD_LOGIC;



--type rom_type is array (0 to 255) of std_logic_vector(15 downto 0);
--signal ROM: rom_type :=(
--    X"0001",
--    X"0003",
--    X"0005",
--    X"0008",
--    X"000A",
--    X"0F00",
--    others => X"0000");
    

--mgp  ---trebuie sa schimb numele din problema13 in mpg
--component problema13 is
--    Port ( clk : in STD_LOGIC;
--           enable : out STD_LOGIC;
--           btn : in STD_LOGIC);
--end component;

--component SSD is
--    Port ( digit : in STD_LOGIC_VECTOR (15 downto 0);
--           clk : in STD_LOGIC;
--           cat : out STD_LOGIC_VECTOR (6 downto 0);
--           an : out STD_LOGIC_VECTOR (3 downto 0));
--end component;

--component REG_FILE is
--    Port ( clk : in STD_LOGIC;
--    RegWr : in std_logic;
   
--    RA1 : in std_logic_vector(3 downto 0);
--    RA2 : in std_logic_vector(3 downto 0); 
    
--    RD1 : out std_logic_vector(15 downto 0);
--    RD2 : out std_logic_vector(15 downto 0);
    
--    WA : in std_logic_vector(3 downto 0);
--    WD : in std_logic_vector(15 downto 0));      
--end component;

--semnale reg_file laboratorul 3 
--signal a: std_logic_vector(15 downto 0):=(others=>'0');
--signal cnt: std_logic_vector(7 downto 0) :=(others=>'0');
--signal enable_e1: std_logic;
--signal rd : std_logic_vector(15 downto 0) := (others=>'0');
--signal rd1 : std_logic_vector(15 downto 0) := (others=>'0');
--signal rd2 : std_logic_vector(15 downto 0) := (others=>'0');

--component RAM is
--port ( clk : in std_logic;
--    we : in std_logic;
--    en : in std_logic;
--    addr : in std_logic_vector(7 downto 0);
--    di : in std_logic_vector(15 downto 0);
--    do : out std_logic_vector(15 downto 0));
--end component;

----semnale lab 3 RAM 
--signal enable_e2 : std_logic := '0';
--signal ram_out : std_logic_vector(15 downto 0) := (others=> '0');
--signal ram_shift : std_logic_vector(15 downto 0) := (others=> '0');

-- ------------------------ begin------------------------
--semnalele de la ual laboratorul 2 
--sig1(15 downto 0) <="000000000000" & sw(3 downto 0);
--sig2(15 downto 0) <="000000000000" & sw(7 downto 4);
--sig3(15 downto 0) <="00000000" & sw(7 downto 0);


--port mapuri de la laboratorul 3 ROM 
--impuls: problema13 port map (clk, enable_e, btn(2)); 
--afisor: SSD port map( a, clk, cat, an); 


--port mapuri de la laboratorul 1 
--comp : problema13 port map(clk,enable_e,btn(1));
--comp2 : SSD port map(leduri, clk, cat,an);


-- de la laboratorul 1
--process(clk,btn(0),sw(2))
--begin
 --   if clk='1' and clk'event then
  --      if enable_e = '1' then
    --        if sw(2)= '1' then
      --          leduri <= leduri + 1;
       --     else
        --        leduri <= leduri - 1;
         --    end if;
     --    end if;
   --  end if;
-- end process;
 
 
-- process(clk) -- numaratorul pe 2 biti de la laboratorul 2 
--begin
--    if clk='1' and clk'event then
--        if enable_e='1' then
--            if sw(0)='1' then
--                numarator2b <= numarator2b + 1;
--            else
--                numarator2b <= numarator2b - 1;
--            end if;
--        end if;
--    end if;
--end process;


-- alu de la laboratorul 2 
--process(numarator2b, sig1, sig2, sig3) -- MUX 4:1
--begin
--    case numarator2b is
--        when "00" => leduri<= sig1 + sig2; -- ADD
--        when "01" => leduri <= sig1 - sig2; -- SUB
--        when "10" => leduri(15 downto 2) <= sig3(13 downto 0); -- SHIFT LEFT 2
--                     leduri(1 downto 0) <= "00";
--        when others => leduri(13 downto 0) <= sig3(15 downto 2); -- SHIFT RIGHT 2
--                       leduri(15 downto 14) <= "00";
--    end case;
 
--     if leduri = "0000000000000000" then
--        led(7) <= '1';
--    else
--        led(7) <= '0';
--    end if;
    
--     led <= leduri;
--   end process;
   
    
   -- atribuire de la laboratorul 1 
    -- an <= btn(3 downto 0);
    -- cat <= (others=>'0');
    
    
   --procesul de la laboratorul 3 ROM  
--    process(clk, enable_e)
--    begin 
--    if enable_e = '1' then 
--        if clk = '1' and clk'event then 
--            cnt <= cnt +1; 
--        end if;
--    end if; 
--    end process;
    
--    a <= ROM(conv_integer(cnt));
    
    
    --laborator 3 
    --port mapuri Reg_file 
--    mpg : problema13 port map(clk,  enable_e1, btn(1));
--    r : REG_FILE port map (clk, enable_e1, cnt(3 downto 0),cnt(3 downto 0),rd1, rd2, cnt(3 downto 0),rd);
    
    --cod 
--     rd <= rd1 + rd2;
--     a <= rd1 + rd2; 

--    --port mapuri RAM
--    mpg2 : problema13 port map(clk, enable_e2, btn(2));
--    ram1: RAM port map(clk,enable_e1, enable_e2,cnt(7 downto 0), ram_shift, ram_out);
--    ram_shift <= ram_out(13 downto 0 ) & "00";
--    a <= ram_shift;


    
    ------------- DE AICI INCEPE MIPS lab 05 -----------------------------------------------------------
    component problema13 is
        Port ( clk : in STD_LOGIC;
               enable : out STD_LOGIC;
               btn : in STD_LOGIC);
    end component;
    
    
    component SSD is
        Port ( digit : in STD_LOGIC_VECTOR (15 downto 0);
               clk : in STD_LOGIC;
               cat : out STD_LOGIC_VECTOR (6 downto 0);
               an : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
     
    component InstructionFetch is
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
    end component;
    
    
    component ID is
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
    end component;
    
    component MainControl is
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
    end component;
    component EX is
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
    end component;
    
    component MEM is
        Port (clk : in std_logic;
        MemWrite : in std_logic;
        en : in std_logic;
        DataIn : in std_logic_vector(15 downto 0);
        RD2 : in std_logic_vector(15 downto 0);
        MemData : out std_logic_vector(15 downto 0); 
        ALURes : out std_logic_vector(15 downto 0));
    end component;

 signal en : STD_LOGIC;
 signal PCsrc : STD_LOGIC;
 signal rst : STD_LOGIC;
 signal digits: std_logic_vector(15 downto 0 );
 signal Instruction : std_logic_vector(15 downto 0 );
 signal PCinc : std_logic_vector(15 downto 0 );
 
  signal WriteData : std_logic_vector(15 downto 0 );
  signal RegWrite : std_logic;
  signal RegDst : std_logic;
  signal ExtOp : std_logic; 
  signal RD1 : std_logic_vector(15 downto 0 );
  signal RD2 : std_logic_vector(15 downto 0 );
  signal ExtImm : std_logic_vector(15 downto 0 );
  signal func : std_logic_vector(2 downto 0 );
  signal sa : std_logic;
  signal MemtoReg : std_logic;
  signal Branch :  std_logic;
  signal  Jump : std_logic;
  signal  MemWrite :  std_logic;
  signal  ALUSrc:  std_logic;
  signal  ALUOp:  std_logic_vector(2 downto 0);
  
  signal ALURes : std_logic_vector(15 downto 0) := x"0000";
   signal ALURes2 : std_logic_vector(15 downto 0) := x"0000";
  signal Zero : std_logic := '0';
  signal BranchAddress : std_logic_vector(15 downto 0) := x"0000";
  signal JumpAddress : std_logic_vector(15 downto 0) := x"0000";
  signal MemData : std_logic_vector(15 downto 0 );
 begin 
    
   --trebuie sa schimb numele din problema13 in -----mpg------ 
     mpg1 : problema13 port map(clk, en, btn(0));
     mpg2 : problema13 port map(clk, rst, btn(1));
     inst_IF : InstructionFetch port map(clk, rst, en, jump, PCsrc,JumpAddress,BranchAddress,Instruction, PCinc);
     inst_ID : ID port map (clk,Instruction, WriteData,RegWrite, RegDst, ExtOp, RD1, RD2, ExtImm, func, sa, en );
    
     process (sw(7 downto 5))
     begin 
        case sw(7 downto 5) is
            when "000" => digits <= Instruction;
            when "001" => digits <= PCinc;
            when "010" => digits <=RD1; 
            when "011" => digits <= RD2 ;
            when "100" => digits <= WriteData ;
            when   others => digits <=x"0000";
     end case;
     end process; 
       with MemtoReg select
           WriteData  <= MemData when '1',
                         ALUres2 when '0',
                        (others => '0') when others;
   
       -- branch control
       PCSrc <= Zero and Branch;
   
       -- jump address
     JumpAddress <= PCinc(15 downto 13) & Instruction(12 downto 0);
     
     afisor: SSD port map( digits, clk, cat, an);
     main : MainControl port map(Instruction(15 downto 13), RegDst, ExtOp, ALUSrc, Branch, Jump, ALUOp, MemWrite, MemtoReg, RegWrite );
     ex1: EX port map(RD1, ALUSrc, RD2, ExtImm, sa, func, ALUOp, PCinc, ALURes, BranchAddress, Zero );
     MemorieRam : MEM port map(clk,MemWrite, en, ALURes, RD2, MemData, ALURes2);
    
end Behavioral;

