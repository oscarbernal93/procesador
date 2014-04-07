LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
 
ENTITY psrmod_tb IS
END psrmod_tb;
 
ARCHITECTURE behavior OF psrmod_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT psrmod
    PORT(
         ALUOP : IN  std_logic_vector(4 downto 0);
         ALU1 : IN  std_logic_vector(31 downto 0);
         ALU2 : IN  std_logic_vector(31 downto 0);
         ALUR : IN  std_logic_vector(31 downto 0);
         nzvc : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ALUOP : std_logic_vector(4 downto 0) := (others => '0');
   signal ALU1 : std_logic_vector(31 downto 0) := (others => '0');
   signal ALU2 : std_logic_vector(31 downto 0) := (others => '0');
   signal ALUR : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal nzvc : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace CLK below with 
   -- appropriate port name 
	signal CLK : std_logic;
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: psrmod PORT MAP (
          ALUOP => ALUOP,
          ALU1 => ALU1,
          ALU2 => ALU2,
          ALUR => ALUR,
          nzvc => nzvc
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

		ALUOP <= "00010";
      ALU1 <= "01000000000000000000000000000100";
      ALU2 <= "01000000000000000000000000000010";
      ALUR <= "10000000000000000000000000000110";

		wait for 100 ns;
		
		ALUOP <= "00010";
      ALU1 <= "01111111111111111111111111111111";
      ALU2 <= "00000000000000000000000000000001";
      ALUR <= "10000000000000000000000000000000";

		wait for 100 ns;
		
		ALUOP <= "00010";
      ALU1 <= "11111111111111111111111111111111";
      ALU2 <= "00000000000000000000000000000001";
      ALUR <= "00000000000000000000000000000000";

		wait for 100 ns;
		
		ALUOP <= "00011";
      ALU1 <= "00010001000000001000001000010010";
      ALU2 <= "00010001000000001000001000010010";
      ALUR <= "00000000000000000000000000000000";
		
		wait for 100 ns;
		
		ALUOP <= "00011";
      ALU1 <= "00000000000000000000000000000000";
      ALU2 <= "00000000000000000000000000000000";
      ALUR <= "00000000000000000000000000000000";
		
		wait for 100 ns;
		
		ALUOP <= "00011";
      ALU1 <= "00000100000001000001000000100010";
		ALU2 <= "00001100101000010000001000001000";     
		-- com2  11110011010111101111110111111000
      ALUR <= "11110111011000110000111000011010";
		
		wait for 100 ns;
		
		ALUOP <= "00011";
      ALU1 <= "11111111111111111111111111111110"; -- -2
		ALU2 <= "11111111111111111111111111111111"; -- -1
      ALUR <= "11111111111111111111111111111111"; -- -1
		
		wait for 100 ns;
		
		ALUOP <= "00011";
      ALU1 <= "11111111111111111111111111111111"; -- -1
		ALU2 <= "00000000000000000000000000000010"; -- 2
      ALUR <= "11111111111111111111111111111111"; -- -3
      wait;
   end process;

END;
