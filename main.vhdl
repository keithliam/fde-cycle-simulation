library ieee;
use STD.textio.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;

entity main is
end main;

architecture behav of main is
	type mem is array (0 to 14) of std_logic_vector(0 to 31);
	signal t_mem : mem;
	signal this : std_logic_vector(0 to 31);
begin
	process 
	file f : text;
	variable l : line;
	variable i : integer := 0;
	variable b : std_logic_vector(0 to 31);
	begin
		file_open(f, "./input.txt", read_mode);
		while ((i <= 14) and (not endfile(f))) loop
			readline(f, l);
			report l.all;
			read(l, b);
			t_mem(i) <= b;
			i := i + 1;
			this <= b;
			wait for 10 ns;
		end loop;
		file_close(f);
		wait;
    end process;
end behav;