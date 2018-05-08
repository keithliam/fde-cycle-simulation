library ieee;
use ieee.std_logic_1164.all;

entity main is
	port(input1, input2: in std_logic; output1: out std_logic);
end main;

architecture behav of main is
begin
	process
	begin
		output1 <= input1 and input2;
		wait on input1, input2;
	end process;
end behav;