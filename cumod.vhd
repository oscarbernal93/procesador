library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity cumod is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUOP : out  STD_LOGIC_VECTOR (4 downto 0));
end cumod;

architecture Behavioral of cumod is

begin
process(op,op3)
	begin
		IF op = "10" THEN
			-- ADD
			IF op3 = "000000" THEN
				ALUOP <= "00000";
			-- ADDcc
			ELSIF op3 = "010000" THEN
				ALUOP <= "00001";
			-- ADDX
			ELSIF op3 = "001000" THEN
				ALUOP <= "00010";
			-- ADDXcc
			ELSIF op3 = "011000" THEN
				ALUOP <= "00011";
			-- SUB
			ELSIF op3 = "000100" THEN
				ALUOP <= "00100";
			-- SUBcc
			ELSIF op3 = "010100" THEN
				ALUOP <= "00101";
			-- SUBX
			ELSIF op3 = "001100" THEN
				ALUOP <= "00110";
			-- SUBXcc
			ELSIF op3 = "011100" THEN
				ALUOP <= "00111";
			-- AND
			ELSIF op3 = "000001" THEN
				ALUOP <= "01000";
			-- ANDcc
			ELSIF op3 = "010001" THEN
				ALUOP <= "01001";
			-- OR
			ELSIF op3 = "000010" THEN
				ALUOP <= "01010";
			-- ORcc
			ELSIF op3 = "010010" THEN
				ALUOP <= "01011";
			-- XOR
			ELSIF op3 = "000011" THEN
				ALUOP <= "01100";
			-- XORcc
			ELSIF op3 = "010011" THEN
				ALUOP <= "01101";			
			END IF;
		END IF;
	end process;

end Behavioral;

