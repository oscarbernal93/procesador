library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity psrmod is
    Port ( ALUOP : in  STD_LOGIC_VECTOR (4 downto 0);
           ALU1 : in  STD_LOGIC_VECTOR (31 downto 0);
           ALU2 : in  STD_LOGIC_VECTOR (31 downto 0);
           ALUR : in  STD_LOGIC_VECTOR (31 downto 0);
           nzvc : out  STD_LOGIC_VECTOR (3 downto 0));
end psrmod;

architecture Behavioral of psrmod is
begin
process (ALUOP,ALU1,ALU2,ALUR)
	begin
	   nzvc <= "0000";
		if (ALUOP = "00010") then --suma mod icc 
			if (ALU1(30) = '1' AND ALU2(30) = '1') then -- carry
				-- nzvc(0) <= '1'; -- malo
			end if;
			if (signed(ALUR) < signed(ALU1) or signed(ALUR) < signed(ALU2)) then  -- overflow
				nzvc(1) <= '1';  -- falla con numeros negativos
			end if;
			if (ALUR = 0) then
				nzvc(2) <= '1';   -- z = 1
			end if;
		elsif (ALUOP = "00011") then --resta mod icc
			if (ALUR = 0) then -- Zero
				nzvc(2) <= '1';   -- z = 1
			elsif (ALU2 > ALU1) then  --  ALUR(31) = 1 ?
				nzvc(3) <= '1';  -- negative
			end if;
		end if;
	end process;
end Behavioral;

