library ieee;
use ieee.std_logic_1164.all;

entity SR_FF is
	port(S, R: in std_logic; Q, QT: inout std_logic);
end SR_FF;

architecture structure of SR_FF is
	component S_R_FF
		port(i0, i1: in std_logic; o1: out std_logic);
	end component;
begin
	i1: S_R_FF port map(S, QT, Q);
	i2: S_R_FF port map(R, Q, QT);
end structure;

