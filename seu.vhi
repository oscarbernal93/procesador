
-- VHDL Instantiation Created from source file seu.vhd -- 09:39:09 03/31/2014
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT seu
	PORT(
		simm13 : IN std_logic_vector(12 downto 0);          
		immediate : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_seu: seu PORT MAP(
		simm13 => ,
		immediate => 
	);


