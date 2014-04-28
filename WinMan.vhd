library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity WinMan is
    Port ( rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
			  op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           cwp : in  STD_LOGIC_VECTOR (4 downto 0);
           nrs1 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrs2 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrd : out  STD_LOGIC_VECTOR (5 downto 0);
			  ncwp : out  STD_LOGIC_VECTOR (4 downto 0):= "00000");
end WinMan;

architecture Behavioral of WinMan is

begin
process (rs1,rs2,rd,op,op3,cwp) begin

if (op = "10" and op3 = "111100") then --save
	if (cwp = "00001") then -- (cwp > 0) --> (cwp == 1)  
		ncwp <= "00000";
		else
		ncwp <= "00001";
		end if;
	--if ((WIM and 2new_cwp ) ≠ 0) then (
		--trap <= 1;
		--window_overflow ← 1
		--) else (
		--	cwp <= ncwp
		--)
else if (op = "10" and op3 = "111101") then  --restore
	if (cwp = "00000") then -- (cwp < 0) --> (cwp == 0) 
		ncwp <= "00001";
		else
		ncwp <= "00000";
		end if;
		
	--if ((WIM and 2new_cwp ) ≠ 0) then (
		--trap <= 1;
		--window_underflow ← 1
		--) else (
		--result <= r[rs1] + operand2;
		--CWP <= new_cwp
		---)
	end if;
end if;
		
if (rs1 >= "00000" and rs1 <= "00111") then
	-- la operacion & concatena un 0 para igualar tamaño
	nrs1 <= ('0' & rs1);
elsif (rs1 >= "11000" and rs1 <= "11111")	then
	nrs1 <= ('0' & rs1) - (conv_integer(cwp) * 16);  -- cwp * 16
elsif (rs1 >= "10000" and rs1 <= "10111") then
	nrs1 <= ('0' & rs1) + (conv_integer(cwp) * 16); -- cwp * 16
elsif (rs1 >= "01000" and rs1 <= "01111") then
	nrs1 <= ('0' & rs1) + (conv_integer(cwp) * 16); -- cwp * 16
end if;

if (rs2 >= "00000" and rs2 <= "00111") then
	-- la operacion & concatena un 0 para igualar tamaño
	nrs2 <= ('0' & rs2);
elsif (rs2 >= "11000" and rs2 <= "11111")	then
	nrs2 <= ('0' & rs2) - (conv_integer(cwp) * 16);  -- cwp * 16
elsif (rs2 >= "10000" and rs2 <= "10111") then
	nrs2 <= ('0' & rs2) + (conv_integer(cwp) * 16); -- cwp * 16
elsif (rs2 >= "01000" and rs2 <= "01111") then
	nrs2 <= ('0' & rs2) + (conv_integer(cwp) * 16); -- cwp * 16
end if;

if (rd >= "00000" and rd <= "00111") then
	-- la operacion & concatena un 0 para igualar tamaño
	nrd <= ('0' & rd);
elsif (rd >= "11000" and rd <= "11111")	then
	nrd <= ('0' & rd) - (conv_integer(cwp) * 16);  -- cwp * 16
elsif (rd >= "10000" and rd <= "10111") then
	nrd <= ('0' & rd) + (conv_integer(cwp) * 16); -- cwp * 16
elsif (rd >= "01000" and rd <= "01111") then
	nrd <= ('0' & rd) + (conv_integer(cwp) * 16); -- cwp * 16
end if;



end process;
end Behavioral;

