library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- para bailar la bamaba se necesita una poca de gracia!
-- una poca de gracia y na cancion ay arriba y arriba

entity addmod is
    Port ( op1 : in  STD_LOGIC_VECTOR (31 downto 0);
           op2 : in  STD_LOGIC_VECTOR (31 downto 0);
           salida : out  STD_LOGIC_VECTOR (31 downto 0));
end addmod;

architecture Behavioral of addmod is

begin
	--salida <= op1 + op2;
	salida <= op1 + 4;

end Behavioral;

