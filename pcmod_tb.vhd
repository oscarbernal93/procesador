
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY pcmod_tb IS
END pcmod_tb;
 
ARCHITECTURE behavior OF pcmod_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pcmod
    PORT(
         PC_IN : IN  std_logic_vector(31 downto 0);
         CLK : IN  std_logic;
         RST : IN  std_logic;
         PC_OUT : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal PC_IN : std_logic_vector(31 downto 0) := (others => '0');
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';

 	--Outputs
   signal PC_OUT : std_logic_vector(31 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pcmod PORT MAP (
          PC_IN => PC_IN,
          CLK => CLK,
          RST => RST,
          PC_OUT => PC_OUT
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		CLK <= '1';
		PC_IN <= "00000000000000000000000000001000"; 
		wait for 100 ns;
		CLK <= '0';
		PC_IN <= "00000000000000000000000000001001";
		wait for 100 ns;
		CLK <= '1';
		PC_IN <= "00000000000000000000000000001010";
      wait;
   end process;

END;
