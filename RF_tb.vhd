
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

 
ENTITY RF_tb IS
END RF_tb;
 
ARCHITECTURE behavior OF RF_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RF
    PORT(
         rs1 : IN  std_logic_vector(4 downto 0);
         rs2 : IN  std_logic_vector(4 downto 0);
         rd : IN  std_logic_vector(4 downto 0);
         dwr : IN  std_logic_vector(31 downto 0);
         rst : IN  std_logic;
         clk : IN  std_logic;
         CRs1 : OUT  std_logic_vector(31 downto 0);
         CRs2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal rs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal rd : std_logic_vector(4 downto 0) := (others => '0');
   signal dwr : std_logic_vector(31 downto 0) := (others => '0');
   signal rst : std_logic := '0';
   signal clk : std_logic := '1';

 	--Outputs
   signal CRs1 : std_logic_vector(31 downto 0);
   signal CRs2 : std_logic_vector(31 downto 0);

   -- Clock period definitions
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RF PORT MAP (
          rs1 => rs1,
          rs2 => rs2,
          rd => rd,
          dwr => dwr,
          rst => rst,
          clk => clk,
          CRs1 => CRs1,
          CRs2 => CRs2
        );
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		clk <= '1';
      -- insert stimulus here 
		rd <= "00001";
		dwr <= "00000000000000000000000000000011";
		wait for 100 ns;
		rd <= "00010";
		dwr <= "00000000000000000000000000000100";
		wait for 100 ns;
		rs1 <= "00001";
		rs2 <= "00010";
		rd <= "00000";
      wait;
   end process;

END;
