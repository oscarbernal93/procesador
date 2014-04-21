library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- PSR

-- +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
-- | Impl  |  ver  |  icc  | reserved  |C|F|  PIL  |S|P|T|   CWP   | 
-- +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
--  3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
--  1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0

entity psr is
    Port ( nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
			  CLK : in STD_LOGIC;
			  RST : in STD_LOGIC;
			  ncwp : in STD_LOGIC_VECTOR (4 downto 0) := "00000";
           carry : out  STD_LOGIC := '0';
			  cwp : out STD_LOGIC_VECTOR (4 downto 0));
end psr;

architecture Behavioral of psr is
SIGNAL rpsr : std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
begin
process (rpsr,nzvc,CLK, RST)
	begin	
	if rst = '1' then
		carry <= '0';
		cwp <= "00000";
	else
		IF rising_edge(CLK) THEN
			rpsr (23 downto 20) <= nzvc;
			carry <= rpsr (20);
			cwp <= rpsr (4 downto 0);
			rpsr (4 downto 0) <= ncwp;
		END IF;
	end if;
	end process;
end Behavioral;

