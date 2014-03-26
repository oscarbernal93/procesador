library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity cumod is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUOP : out  STD_LOGIC_VECTOR (4 downto 0));
end cumod;

architecture Behavioral of cumod is

begin
	process	begin
		IF op = "10" THEN
			IF op3 = "000000" THEN
				--suma
				ALUOP <= "00000";
			ELSIF op3 = "000100" THEN
				--resta
				ALUOP <= "00001";
			END IF;
		END IF;
	end process;

end Behavioral;

