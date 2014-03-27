library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity connect is
	Port ( rst : in  STD_LOGIC;
			 clk : in STD_LOGIC);
end connect;

architecture Behavioral of connect is

COMPONENT ALU
    Port ( ope1 : in  STD_LOGIC_VECTOR (31 downto 0);
           ope2 : in  STD_LOGIC_VECTOR (31 downto 0);
           ALUOP : in  STD_LOGIC_VECTOR (4 downto 0);
           result : out  STD_LOGIC_VECTOR (31 downto 0));
end COMPONENT;

COMPONENT RF
    Port ( rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           dwr : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
			  clk : in STD_LOGIC;
           CRs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           CRs2 : out  STD_LOGIC_VECTOR (31 downto 0));
end COMPONENT;

COMPONENT addmod
    Port ( op1 : in  STD_LOGIC_VECTOR (31 downto 0);
           op2 : in  STD_LOGIC_VECTOR (31 downto 0);
           salida : out  STD_LOGIC_VECTOR (31 downto 0));
end COMPONENT;

COMPONENT cumod
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUOP : out  STD_LOGIC_VECTOR (4 downto 0));
end COMPONENT;

COMPONENT instructionMemory
    Port ( clk : in  STD_LOGIC;
           address : in  STD_LOGIC_VECTOR (31 downto 0);
           reset : in  STD_LOGIC;
           outInstruction : out  STD_LOGIC_VECTOR (31 downto 0));
end COMPONENT;

COMPONENT pcmod
    Port ( PC_IN : in  STD_LOGIC_VECTOR (31 downto 0);
           CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           PC_OUT : out  STD_LOGIC_VECTOR (31 downto 0));
end COMPONENT;

signal sum_npc : std_logic_vector (31 downto 1);
signal npc_sum : std_logic_vector (31 downto 1);
signal pc_im : std_logic_vector (31 downto 1);
signal im_rf : std_logic_vector (31 downto 1);
signal rf_alu1 : std_logic_vector (31 downto 1);
signal rf_alu2 : std_logic_vector (31 downto 1);
signal alu_rf : std_logic_vector (31 downto 1);
signal cu_alu : std_logic_vector (4 downto 1);

begin

--im_rf
--+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
--|1 0|   rd    |    op3    |  rs1    |0| unused(zero)  |  rs2    |
--+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
-- 3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
-- 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0

usum: addmod PORT MAP (npc_sum,"00000000000000000000000000000000",sum_npc);
unpc: pcmod PORT MAP (sum_npc,clk,rst,npc_sum);
upc: pcmod PORT MAP (npc_sum,clk,rst,pc_im);
uim: instructionMemory PORT MAP (clk,pc_im,rst,im_rf);
urf: rf PORT MAP (im_rf(18 downto 14), im_rf(4 downto 0), im_rf(29 downto 30), alu_rf, rst, clk, rf_alu1, rf_alu2);
ucu: cumod PORT MAP (im_rf(31 downto 30),im_rf(24 downto 19),cu_alu);
ualu: alu PORT MAP (rf_alu1,rf_alu2,cu_alu,alu_rf);

end Behavioral;

