
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY psr_tb IS
END psr_tb;
 
ARCHITECTURE behavior OF psr_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT psr
    PORT(
         nzvc : IN  std_logic_vector(3 downto 0);
         CLK : IN  std_logic;
         RST : IN  std_logic;
         ncwp : IN  std_logic_vector(4 downto 0);
         carry : OUT  std_logic;
         cwp : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal nzvc : std_logic_vector(3 downto 0) := (others => '0');
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal ncwp : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal carry : std_logic;
   signal cwp : std_logic_vector(4 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: psr PORT MAP (
          nzvc => nzvc,
          CLK => CLK,
          RST => RST,
          ncwp => ncwp,
          carry => carry,
          cwp => cwp
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

      wait for 100 ns;	
		nzvc <= "0100";
		ncwp <= "00100";
      wait for CLK_period*10;
		nzvc <= "0011";
		ncwp <= "00011";
		wait for CLK_period*10; 
		nzvc <= "0010";
		ncwp <= "00010";
		wait for CLK_period*10; 
		nzvc <= "1100";
		ncwp <= "01100";
      wait;
   end process;

END;
