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
           cwp : in  STD_LOGIC_VECTOR (4 downto 0);
           nrs1 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrs2 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrd : out  STD_LOGIC_VECTOR (5 downto 0);
			  ncwp : out  STD_LOGIC_VECTOR (4 downto 0));
end WinMan;

architecture Behavioral of WinMan is

begin
process (rs1,rs2,rd,cwp)
begin
if (rs1 >= "00000" and rs1 <= "00111") then
	-- la operacion & concatena un 0 para igualar tamaño
	nrs1 <= ('0' & rs1);
elsif (rs1 >= "11000" and rs1 <= "11111")	then
	nrs1 <= rs1 - (cwp * "10000");  -- cwp * 16
elsif (rs1 >= "10000" and rs1 <= "10111") then
	nrs1 <=  rs1 + (cwp * "10000"); -- cwp * 16
elsif (rs1 >= "01000" and rs1 <= "01111") then
	nrs1 <= rs1 + (cwp * "10000"); -- cwp * 16
end if;
end process;
end Behavioral;

