library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity psr is
    Port ( nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
			  CLK : in STD_LOGIC;
			  RST : in STD_LOGIC;
           carry : out  STD_LOGIC);
end psr;

architecture Behavioral of psr is
SIGNAL rpsr : std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
begin
process (rpsr,nzvc,CLK, RST)
	begin	
	if rst then
		carry <= '0';
	else
		IF rising_edge(CLK) THEN
			rpsr (23 downto 20) <= nzvc;
			carry <= rpsr (20);
		END IF;
	end if;
	end process;
end Behavioral;

