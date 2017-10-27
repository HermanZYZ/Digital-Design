--Control Unit
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY CtrlUnit IS
PORT
(
	instOP			: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
	instFUNC		: IN STD_LOGIC_VECTOR (5 DOWNTO 0);

	ALUOP			: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
	BRANCH			: OUT STD_LOGIC;
	REGWRITE		: OUT STD_LOGIC;
	REGDST			: OUT STD_LOGIC;
	MEMWRITE		: OUT STD_LOGIC;
	MEMTOREG		: OUT STD_LOGIC;
	ALUSRC			: OUT STD_LOGIC
);
END ENTITY CtrlUnit;

ARCHITECTURE SelectResult OF CtrlUnit IS
BEGIN
	ALUOP <= 	"1101" WHEN (
					instOP = "000000" and instFUNC = "100010"--A¼õB£¬ÓÐ·ûºÅ
			) else 
			
	"0110" WHEN (
					(instOP = "000000" and instFUNC = "100000") 
	or	(instOP = "101011" ) -- SW
				or	(instOP = "100011" ) -- LW

			) else 
	"1111"; --Not defined yet


	BRANCH	<= '1' WHEN (
				(instOP = "000100") -- B,BEQ
		) else
	'0';

	REGWRITE <= '1' WHEN (
				(instOP = "000000"	) -- Special
			or	(instOP = "100011" ) -- LW
		) else
	'0';

	REGDST	<= '1' WHEN (
				(instOP = "000000" and instFUNC = "100000") -- ADD
			or	(instOP = "000000" and instFUNC = "100010") -- SUB
			
		) else
	'0';

	MEMWRITE <= '1' WHEN (
				(instOP = "101011" ) -- SW
		) else
	'0';

	MEMTOREG <= '1' WHEN (						
				(instOP = "100011" ) -- LW
		) else
	'0';

	ALUSRC	<= '1' WHEN (						
				(instOP = "100011" ) -- LW
			or	(instOP = "101011" ) -- SW
		) else
	'0';


END ARCHITECTURE SelectResult;

