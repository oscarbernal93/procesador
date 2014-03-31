library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity seu is
    Port ( simm13 : in  STD_LOGIC_VECTOR (12 downto 0);
           immediate : out  STD_LOGIC_VECTOR (31 downto 0));
end seu;

architecture Behavioral of seu is

begin
process(simm13) begin

	immediate <= (OTHERS => '0');  -- inicializar en 0
	immediate (12 downto 0) <= simm13;  -- copiar los 13 bits menos significativos

end process;

end Behavioral;

