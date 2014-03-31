
-- VHDL Instantiation Created from source file muxer.vhd -- 09:33:43 03/31/2014
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT muxer
	PORT(
		CRs2 : IN std_logic_vector(31 downto 0);
		immediate : IN std_logic_vector(31 downto 0);
		i : IN std_logic;          
		ope2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_muxer: muxer PORT MAP(
		CRs2 => ,
		immediate => ,
		i => ,
		ope2 => 
	);


