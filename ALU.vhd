library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
    Port ( ope1 : in  STD_LOGIC_VECTOR (31 downto 0);
           ope2 : in  STD_LOGIC_VECTOR (31 downto 0);
           ALUOP : in  STD_LOGIC_VECTOR (4 downto 0);
			  carry : in STD_LOGIC := '0';
           result : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is

begin

proc:process(ope1,ope2,ALUOP)
	begin
		IF (ALUOP = "00000" or ALUOP = "00001") THEN -- ADD ADDcc
			result <= Ope1 + Ope2;
		ELSIF (ALUOP = "00100" or ALUOP = "00101") THEN -- SUB SUBcc
			result <= Ope1 - Ope2;
		ELSIF (ALUOP = "00010" or ALUOP = "00011") THEN -- ADDX ADDXcc
			result <= Ope1 + Ope2 + carry;
		ELSIF (ALUOP = "00110" or ALUOP = "00111") THEN -- SUBX SUBXcc
			result <= Ope1 - Ope2 - carry;
		ELSIF (ALUOP = "01000" or ALUOP = "01001") THEN -- AND ANDcc
			result <= Ope1 and Ope2;
		ELSIF (ALUOP = "01010" or ALUOP = "01011") THEN -- OR ORcc
			result <= Ope1 or Ope2;
		ELSIF (ALUOP = "01100" or ALUOP = "01101") THEN -- XOR XORcc
			result <= Ope1 xor Ope2;
		END IF;
	end process proc;

end Behavioral;

