library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RF is
    Port ( rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           dwr : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
			  clk : in STD_LOGIC;
           CRs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           CRs2 : out  STD_LOGIC_VECTOR (31 downto 0));
end RF;

architecture Behavioral of RF is

type rf_rom is array (0 to 31) of std_logic_vector (31 downto 0);
	impure function InitRomRf return rf_rom is
		variable var_rf : rf_rom;
		begin
		for I in rf_rom'range loop
			var_rf(i) := "00000000000000000000000000000000";	
		end loop;
		return var_rf;
	end function;
signal mem_rf : rf_rom := InitRomRf;
begin
process(rs1,rs2,rd,dwr,rst,clk)
begin
		IF RST = '1' THEN
			CRs1 <= "00000000000000000000000000000000";
			CRs2 <= "00000000000000000000000000000000";
		ELSE 
			IF clk = '1' THEN --rising_edge(clk)
				CRs1 <= mem_rf( conv_integer(rs1) );
				CRs2 <= mem_rf( conv_integer(rs2) );
				IF rd /= "00000" THEN
					mem_rf(conv_integer(rd)) <= dwr;
				END IF;
			END IF;
		END IF;
end process;


end Behavioral;