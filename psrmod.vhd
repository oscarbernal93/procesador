library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity psrmod is
    Port ( ALUOP : in  STD_LOGIC_VECTOR (4 downto 0);
           ALU1 : in  STD_LOGIC_VECTOR (31 downto 0);
           ALU2 : in  STD_LOGIC_VECTOR (31 downto 0);
           ALUR : in  STD_LOGIC_VECTOR (31 downto 0);
           nzvc : out  STD_LOGIC_VECTOR (3 downto 0) := "0000");
end psrmod;

architecture Behavioral of psrmod is
begin
process (ALUOP,ALU1,ALU2,ALUR)
	begin
		if (ALUOP = "00001" or ALUOP = "00011") then -- ADDcc ADDXcc
			-- Negative
			nzvc(3) <= ALUR(31);
			-- Zero
			if (ALUR = "00000000000000000000000000000000") then
				nzvc(2) <= '1';
			else
				nzvc(2) <= '0';
			end if;
			-- Overflow
			nzvc(1) <= (ALU1(31) and ALU2(31) and (not ALUR(31))) or ((not ALU1(31)) and (not ALU2(31)) and ALUR(31));
			-- Carry
			nzvc(0) <= (ALU1(31) and ALU2(31)) or ((not ALUR(31)) and (ALU1(31) or ALU2(31)));
		
		elsif (ALUOP = "00101" or ALUOP = "00111") then --SUBcc SUBXcc
			-- Negative
			nzvc(3) <= ALUR(31);
			-- Zero
			if (ALUR = "00000000000000000000000000000000") then
				nzvc(2) <= '1';
			else
				nzvc(2) <= '0';
			end if;
			-- Overflow
			nzvc(1) <= (ALU1(31) and (not ALU2(31)) and (not ALUR(31))) or ((not ALU1(31)) and ALU2(31) and ALUR(31));
			-- Carry
			nzvc(0) <= ((not ALU1(31)) and ALU2(31)) or (ALUR(31) and ((not ALU1(31)) or ALU2(31)));

		elsif (ALUOP = "01001" or ALUOP = "01011" or ALUOP = "01101") then  -- ANDcc ORcc XORcc
			-- Negative
			nzvc(3) <= ALUR(31);
			-- Zero
			if (ALUR = "00000000000000000000000000000000") then 
				nzvc(2) <= '1'; 
			else
				nzvc(2) <= '0';
			end if;
			-- Overflow
			nzvc(1) <= '0';
			-- Carry
			nzvc(1) <= '0';
		end if;
	end process;
end Behavioral;

