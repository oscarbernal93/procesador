library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
    Port ( ope1 : in  STD_LOGIC_VECTOR (31 downto 0);
           ope2 : in  STD_LOGIC_VECTOR (31 downto 0);
           ALUOP : in  STD_LOGIC_VECTOR (4 downto 0);
           result : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is

begin

process	begin
		IF ALUOP = "00000" THEN
			result <= Ope1 + Ope2;
		ELSIF ALUOP = "00001" THEN
			result <= Ope1 - Ope2;
		END IF;
	end process;

end Behavioral;

