LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

ENTITY cumod_tb IS
END cumod_tb;
 
ARCHITECTURE behavior OF cumod_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cumod
    PORT(
         op : IN  std_logic_vector(1 downto 0);
         op3 : IN  std_logic_vector(5 downto 0);
         ALUOP : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal ALUOP : std_logic_vector(4 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cumod PORT MAP (
          op => op,
          op3 => op3,
          ALUOP => ALUOP
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		op <= "10";
		op3 <= "000000";
		
		wait for 100 ns;	
		op3 <= "000100";
      -- insert stimulus here 

      wait;
   end process;

END;
