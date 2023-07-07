library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_bit.all;
use IEEE.numeric_std.all;

entity WateringSystem_testbench is
end WateringSystem_testbench;

architecture tb of WateringSystem_testbench is

	--Component declaration
	component WateringSystem is 
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
	end component;

	--Defines a signal for each port in the WateringSystem
	signal reset : std_logic := '0';
	signal CLK: std_logic := '0';
	signal M_in : std_logic_vector(2 downto 0) := "000";
	signal L_in : std_logic := '0';
	signal T_in : std_logic := '0';
	signal M_out : std_logic_vector(2 downto 0) :="000";
	signal L_out : std_logic := '0';
	signal T_out : std_logic := '0';
	signal STATE : std_logic := '0'; 
	signal SEG : std_logic_vector(6 downto 0) := "0000000";


begin
	--Instantiate the WateringSystem
	ws : WateringSystem 
		port map(
		reset => reset,
		CLK => CLK,
		M_in => M_in,
		L_in => L_in,
		T_in => T_in,
		M_out => M_out,
		L_out => L_out,
		T_out => T_out,
		STATE => STATE,
		SEG => SEG
		);

	Clock : process begin
		CLK <= '0';
		wait for 5 ns;
		CLK <= '1';
		wait for 5 ns;
	end process Clock;


	Main : process begin
		M_in <= "000";
		L_in <= '0';
		T_in <= '1';
		wait for 10 ns;

		M_in <= "000";
		L_in <= '1';
		T_in <= '0';
		wait for 10 ns;

		M_in <= "000";
		L_in <= '0';
		T_in <= '0';
		wait for 10 ns;

		M_in <= "000";
		L_in <= '1';
		T_in <= '1';
		wait for 10 ns;

		M_in <= "001";
		L_in <= '0';
		T_in <= '1';
		wait for 10 ns;

		M_in <= "001";
		L_in <= '1';
		T_in <= '0';
		wait for 10 ns;

		M_in <= "001";
		L_in <= '0';
		T_in <= '0';
		wait for 10 ns;

		M_in <= "001";
		L_in <= '1';
		T_in <= '1';
		wait for 10 ns;

		M_in <= "010";
		L_in <= '0';
		T_in <= '1';
		wait for 10 ns;

		M_in <= "010";
		L_in <= '1';
		T_in <= '0';
		wait for 10 ns;

		M_in <= "010";
		L_in <= '0';
		T_in <= '0';
		wait for 10 ns;

		M_in <= "010";
		L_in <= '1';
		T_in <= '1';
		wait for 10 ns;

		M_in <= "011";
		L_in <= '0';
		T_in <= '1';
		wait for 10 ns;

		M_in <= "011";
		L_in <= '1';
		T_in <= '0';
		wait for 10 ns;

		M_in <= "011";
		L_in <= '0';
		T_in <= '0';
		wait for 10 ns;

		M_in <= "011";
		L_in <= '1';
		T_in <= '1';
		wait for 10 ns;

		M_in <= "100";
		L_in <= '0';
		T_in <= '1';
		wait for 10 ns;

		M_in <= "100";
		L_in <= '1';
		T_in <= '0';
		wait for 10 ns;

		M_in <= "100";
		L_in <= '0';
		T_in <= '0';
		wait for 10 ns;

		M_in <= "100";
		L_in <= '1';
		T_in <= '1';
		wait for 10 ns;

		M_in <= "101";
		L_in <= '0';
		T_in <= '1';
		wait for 10 ns;

		M_in <= "101";
		L_in <= '1';
		T_in <= '0';
		wait for 10 ns;

		M_in <= "101";
		L_in <= '0';
		T_in <= '0';
		wait for 10 ns;

		M_in <= "101";
		L_in <= '1';
		T_in <= '1';
		wait for 10 ns;

		M_in <= "110";
		L_in <= '0';
		T_in <= '1';
		wait for 10 ns;

		M_in <= "110";
		L_in <= '1';
		T_in <= '0';
		wait for 10 ns;

		M_in <= "110";
		L_in <= '0';
		T_in <= '0';
		wait for 10 ns;

		M_in <= "110";
		L_in <= '1';
		T_in <= '1';
		wait for 10 ns;

		M_in <= "111";
		L_in <= '0';
		T_in <= '1';
		wait for 10 ns;

		M_in <= "111";
		L_in <= '1';
		T_in <= '0';
		wait for 10 ns;

		M_in <= "111";
		L_in <= '0';
		T_in <= '0';
		wait for 10 ns;

		M_in <= "111";
		L_in <= '1';
		T_in <= '1';
		wait for 10 ns;

		wait;

	end process Main;


end tb;
	