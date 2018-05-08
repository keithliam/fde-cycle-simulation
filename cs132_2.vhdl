library ieee;
use ieee.std_logic_1164.all;

entity cs132_2 is
	port(S, R: in std_logic; Q, QT: inout std_logic);
end cs132_2;

architecture structure of cs132_2 is
	component cs132_1
		port(i0, i1: in std_logic; o1: out std_logic);
	end component;
begin
	i1: cs132_1 port map(S, QT, Q);
	i2: cs132_1 port map(R, Q, QT);
end structure;

