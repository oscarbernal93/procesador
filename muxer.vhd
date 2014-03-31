library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity muxer is
    Port ( CRs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           immediate : in  STD_LOGIC_VECTOR (31 downto 0);
           i : in  STD_LOGIC;
           ope2 : out  STD_LOGIC_VECTOR (31 downto 0));
end muxer;

architecture Behavioral of muxer is

begin
process(CRs2,immediate,i) begin
	
	IF i = '0' THEN
			ope2 <= CRs2;
		ELSIF i = '1' THEN
			ope2 <= immediate;
		END IF;
	
end process;

end Behavioral;

