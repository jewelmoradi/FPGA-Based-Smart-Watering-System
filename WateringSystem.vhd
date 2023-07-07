library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity WateringSystem is 
	port(   reset : in std_logic;
		CLK : in std_logic;
		M_in : in std_logic_vector(2 downto 0);
		L_in : in std_logic;
		T_in : in std_logic;
		STATE : out std_logic;
		SEG : out std_logic_vector(6 downto 0);
		M_out : out std_logic_vector(2 downto 0);
		L_out : out std_logic;
		T_out : out std_logic );
end entity;

architecture simulation of WateringSystem is

	subtype stateType is std_logic_vector(1 downto 0);
	signal nextState : stateType; 
	signal currentState : stateType := "11";
	signal states : std_logic_vector(1 downto 0);


	function isEqual (A : std_logic := '0'; B : std_logic := '0') return boolean is
	begin
		if (A = '0' and B = '0') then return true;
		else 			     return false;
		end if;
	end function;

begin

	part1: process (ClK , reset) begin
		if CLK'event and CLK = '1' then 
			if reset = '1' then
				currentState <= "11";
			else
				currentState <= nextState;
			end if;
		end if;
	end process part1;

	
	part2: process (M_in, L_in, T_in, currentState) begin
		case currentState is
			when "00" | "11" => if(isEqual(L_in, T_in)) and (M_in > "011") then --state ST0
					nextState <= "00"; --remain in state ST0
					end if;
				if(isEqual(L_in, T_in)) and (M_in <= "011") then
					nextState <= "01"; --go to state ST1
					end if;
				if(not isEqual(L_in, T_in)) and (M_in <= "001") then
					nextState <= "01"; --go to state ST1
					end if;
				if(not isEqual(L_in, T_in)) and (M_in > "001") then
					nextState <= "00"; --remain in state ST0
					end if;

			when "01" => if(isEqual(L_in, T_in)) and (M_in < "111") then --state ST1
					nextState <= "01"; --remain in state ST1
					end if;
				if(M_in >= "111") then
					nextState <= "00"; --go to state ST0
					end if;
				if(not isEqual(L_in, T_in)) and (M_in < "011") then
					nextState <= "01"; --remain in state ST1
					end if;
				if(not isEqual(L_in, T_in)) and (M_in >= "011") then
					nextState <= "00"; --go to state ST0
					end if;

			when others => nextState <= "UU";
		end case;
	end process part2;


	part3: process(currentState) begin
		case currentState is
			when "00" => STATE <= '0';
			when "01" => STATE <= '1';
			when "11" => STATE <= '0'; 
			when others => STATE <= 'U'; 
		end case;	
	end process part3;

	
	states <= currentState;
		T_out <= T_in;
		L_out <= L_in;
		M_out <= M_in;

	SEG <= "0000001"  when states = "00" or states = "11" else --G
		"1011011" when states = "01"; --H

end simulation;
