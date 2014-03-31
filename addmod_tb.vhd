
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
 
ENTITY addmod_tb IS
END addmod_tb;
 
ARCHITECTURE behavior OF addmod_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT addmod
    PORT(
         op1 : IN  std_logic_vector(31 downto 0);
         op2 : IN  std_logic_vector(31 downto 0);
         salida : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal op1 : std_logic_vector(31 downto 0) := (others => '0');
   signal op2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal salida : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: addmod PORT MAP (
          op1 => op1,
          op2 => op2,
          salida => salida
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      -- insert stimulus here 
		op1 <= "00000000000000000000000000000010";
		op2 <= "00000000000000000000000000000011";
		wait for 100 ns;	
      -- insert stimulus here 
		op1 <= "00000000000000000000000000000010";
		op2 <= "00000000000000000000000000000111";
      wait;
   end process;

END;
