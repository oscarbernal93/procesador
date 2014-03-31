LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY muxer_tb IS
END muxer_tb;
 
ARCHITECTURE behavior OF muxer_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT muxer
    PORT(
         CRs2 : IN  std_logic_vector(31 downto 0);
         immediate : IN  std_logic_vector(31 downto 0);
         i : IN  std_logic;
         ope2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CRs2 : std_logic_vector(31 downto 0) := (others => '0');
   signal immediate : std_logic_vector(31 downto 0) := (others => '0');
   signal i : std_logic := '0';

 	--Outputs
   signal ope2 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: muxer PORT MAP (
          CRs2 => CRs2,
          immediate => immediate,
          i => i,
          ope2 => ope2
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		CRs2 <= "00000000000000000000000000000001";
		immediate <= "00000000000000000000000000000010";
		i <= '0';
		wait for 100 ns;
		i <= '1';
      -- insert stimulus here 

      wait;
   end process;

END;
