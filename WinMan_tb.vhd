LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY WinMan_tb IS
END WinMan_tb;
 
ARCHITECTURE behavior OF WinMan_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT WinMan
    PORT(
         rs1 : IN  std_logic_vector(4 downto 0);
         rs2 : IN  std_logic_vector(4 downto 0);
         rd : IN  std_logic_vector(4 downto 0);
         op : IN  std_logic_vector(1 downto 0);
         op3 : IN  std_logic_vector(5 downto 0);
         cwp : IN  std_logic_vector(4 downto 0);
         nrs1 : OUT  std_logic_vector(5 downto 0);
         nrs2 : OUT  std_logic_vector(5 downto 0);
         nrd : OUT  std_logic_vector(5 downto 0);
         ncwp : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal rs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal rd : std_logic_vector(4 downto 0) := (others => '0');
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');
   signal cwp : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal nrs1 : std_logic_vector(5 downto 0);
   signal nrs2 : std_logic_vector(5 downto 0);
   signal nrd : std_logic_vector(5 downto 0);
   signal ncwp : std_logic_vector(4 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: WinMan PORT MAP (
          rs1 => rs1,
          rs2 => rs2,
          rd => rd,
          op => op,
          op3 => op3,
          cwp => cwp,
          nrs1 => nrs1,
          nrs2 => nrs2,
          nrd => nrd,
          ncwp => ncwp
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		
		wait for 10 ns;
		rs1 <= "01010";
		rs2 <= "10100";
		rd <= "11001";
		wait for 10 ns;
		op <= "10";
		op3 <= "111101"; --restore (cwp+1)
		cwp <= "00001";
		wait for 10 ns;
		op <= "00";
		op3 <= "000000"; 
		wait for 10 ns;
		rs1 <= "01010";
		rs2 <= "10100";
		rd <= "11001";
		wait for 10 ns;
		op <= "10";
		op3 <= "111100"; --save (cwp-1)
		cwp <= "00000";
		wait for 10 ns;
		op <= "00";
		op3 <= "000000"; 
		wait for 10 ns;
		rs1 <= "01010";
		rs2 <= "10100";
		rd <= "11001";
		wait for 10 ns;
		op <= "10";
		op3 <= "111100"; --save (cwp-1)
		cwp <= "00000";
		wait for 10 ns;
		op <= "00";
		op3 <= "000000";
		wait for 10 ns;
		rs1 <= "01010";
		rs2 <= "10100";
		rd <= "11001";
      wait;
   end process;

END;
