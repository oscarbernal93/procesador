LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
 
ENTITY psr_tb IS
END psr_tb;
 
ARCHITECTURE behavior OF psr_tb IS 
 
    COMPONENT psr
    PORT(
         nzvc : IN  std_logic_vector(3 downto 0);
         CLK : IN  std_logic;
         carry : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal nzvc : std_logic_vector(3 downto 0) := (others => '0');
   signal CLK : std_logic := '0';

 	--Outputs
   signal carry : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: psr PORT MAP (
          nzvc => nzvc,
          CLK => CLK,
          carry => carry
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		nzvc <= "0100";
      wait for CLK_period*10;
		nzvc <= "0011";
		wait for CLK_period*10; 
		nzvc <= "0010";
		wait for CLK_period*10; 
      wait;
   end process;

END;
