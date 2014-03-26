library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pcmod is
    Port ( PC_IN : in  STD_LOGIC_VECTOR (31 downto 0);
           CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           PC_OUT : out  STD_LOGIC_VECTOR (31 downto 0));
end pcmod;

architecture Behavioral of pcmod is

begin 

	process	begin
		IF RST = '1' THEN
			PC_OUT <= "00000000000000000000000000000000";
		ELSIF rising_edge(CLK) THEN
			PC_OUT <= PC_IN;
		END IF;
	end process;

end Behavioral;

