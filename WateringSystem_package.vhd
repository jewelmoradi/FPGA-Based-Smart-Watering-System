library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

package WateringSystem_package is
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
end WateringSystem_package;
