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
			IF op3 = "000000" THEN
				--suma
				ALUOP <= "00000";
			ELSIF op3 = "000100" THEN
				--resta
				ALUOP <= "00001";
			ELSIF op3 = "010000" THEN
				--suma icc
				ALUOP <= "00010";
			ELSIF op3 = "010100" THEN
				--resta icc
				ALUOP <= "00011";
			END IF;
		END IF;
	end process;

end Behavioral;

