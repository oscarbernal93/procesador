
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
 
ENTITY ALU_tb IS
END ALU_tb;
 
ARCHITECTURE behavior OF ALU_tb IS 

    COMPONENT ALU
    PORT(
         ope1 : IN  std_logic_vector(31 downto 0);
         ope2 : IN  std_logic_vector(31 downto 0);
         ALUOP : IN  std_logic_vector(4 downto 0);
         result : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ope1 : std_logic_vector(31 downto 0) := (others => '0');
   signal ope2 : std_logic_vector(31 downto 0) := (others => '0');
   signal ALUOP : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal result : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          ope1 => ope1,
          ope2 => ope2,
          ALUOP => ALUOP,
          result => result
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		ALUOP <= "00000";
		ope1 <= "00000000000000000000000000000010";
		ope2 <= "00000000000000000000000000000011";
		wait for 100 ns;
		ALUOP <= "00001";
		ope1 <= "00000000000000000000000000000010";
		ope2 <= "00000000000000000000000000000011";
      wait;
   end process;

END;
