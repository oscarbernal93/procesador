library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity WinMan is
    Port ( rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
			  op : in  STD_LOGIC_VECTOR (4 downto 0);
           op3 : in  STD_LOGIC_VECTOR (4 downto 0);
           ncwp : in  STD_LOGIC_VECTOR (4 downto 0);
           cwp : in  STD_LOGIC_VECTOR (4 downto 0);
           nrs1 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrs2 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrd : out  STD_LOGIC_VECTOR (5 downto 0));
end WinMan;

architecture Behavioral of WinMan is

begin


end Behavioral;

