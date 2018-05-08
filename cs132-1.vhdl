library ieee;
use ieee.std_logic_1164.all;

entity S_R_FF is
	port(i0, i1: in std_logic; o1: out std_logic);
end S_R_FF;

architecture behav of S_R_FF is
begin
	process
	begin
		o1 <= (i0 nand i0) nand i1;
		wait on i0, i1;
	end process;
end behav;