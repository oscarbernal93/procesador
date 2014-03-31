
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY seu_tb IS
END seu_tb;
 
ARCHITECTURE behavior OF seu_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT seu
    PORT(
         simm13 : IN  std_logic_vector(12 downto 0);
         immediate : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal simm13 : std_logic_vector(12 downto 0) := (others => '0');

 	--Outputs
   signal immediate : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: seu PORT MAP (
          simm13 => simm13,
          immediate => immediate
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		simm13 <= "0000100001000";
		wait for 100 ns;	
		simm13 <= "0000001000000";
		wait for 100 ns;	
		simm13 <= "0010010010010";
      -- insert stimulus here 

      wait;
   end process;

END;
