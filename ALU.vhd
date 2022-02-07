library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY ALU IS 
	PORT( Clock : IN STD_LOGIC;
	A,B : IN UNSIGNED(7 DOWNTO 0);
	student_id : IN UNSIGNED (3 DOWNTO 0);
	OP : IN UNSIGNED (15 DOWNTO 0);
	Neg: OUT std_logic;
	R1 : OUT UNSIGNED (3 DOWNTO 0);
	R2 : OUT UNSIGNED (3 DOWNTO 0));
END ALU;
ARCHITECTURE calculation of ALU IS
signal Reg1, Reg2, Result : UNSIGNED(7 DOWNTO 0):= (others => '0');
signal Reg4 : UNSIGNED (0 TO 7);
signal temp : UNSIGNED(7 DOWNTO 0);
--signal temp : STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN
REG1 <= A;
REG2 <= B;

PROCESS(Clock, OP, Result)
begin
	
	--if(rising_edge(Clock)) THEN
	Result <= "00000000";
	Neg <= '0';
		case OP is 
			WHEN "0000000000000001" =>
				Result <= (Reg1 + Reg2);
				
			WHEN "0000000000000010" =>
				Result <= (NOT (Reg1 - Reg2)) + 1;
				temp <= (Reg1 - Reg2);
				IF (temp(7)) = '1' THEN
					Neg <= '1';
					
				ELSE
					Neg <= '0';
				END IF;

			WHEN "0000000000000100" =>
				Result <= NOT Reg1;
			WHEN "0000000000001000" =>
				Result <= NOT (Reg1 AND Reg2);
			WHEN "0000000000010000" =>
				Result <= NOT (Reg1 OR Reg2);
			WHEN "0000000000100000" =>
				Result <= (Reg1 AND Reg2);
			WHEN "0000000001000000"=>
				Result <= Reg1 OR Reg2;
			WHEN "0000000010000000"=>
				Result <= Reg1 XOR Reg2;
			WHEN "0000000100000000"=>
				Result <= Reg1 XNOR Reg2;
			WHEN OTHERS =>
				
		end case;
	--end if;
	R1 <= Result(3 DOWNTO 0);
	R2 <= Result(7 DOWNTO 4);
end PROCESS;

end calculation;