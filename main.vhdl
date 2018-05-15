library ieee;
use STD.textio.all;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;

entity main is
end main;

architecture behav of main is
	type mem is array (0 to 14) of std_logic_vector(0 to 31);

	--signals for architecture. for status, 0 if avaiable, otherwise 1
	signal registers : std_logic_vector(0 to 31) := (others => '0'); -- status of R0 to R31
	signal flags : std_logic_vector(0 to 3) := (others => '0'); -- status of Sign, Overflow, Underflow, Zero
	signal stages : std_logic_vector(0 to 4) := (others => '0'); -- status of Fetch, Decode, Execute, Memory, WriteBack
	signal program_counter : std_logic_vector(0 to 3) := (others => '0');
	type values is array (0 to 31) of integer;

	signal t_mem : mem;
	signal this : std_logic_vector(0 to 31);
begin
	process
	file f : text;
	variable l : line;
	variable i : integer := 0;
	variable b : std_logic_vector(0 to 31);
	variable line_count : integer := 0;

	variable stall_flag : std_logic := '0';
	
	variable reg_values : values;
	variable fdemw : values; --contains which instruction is using each stage
	variable reg_used_by : values;

	variable instr : integer;
	variable dst : integer;
	variable src : integer;
	variable tar : integer;

	begin
		file_open(f, "./input.txt", read_mode);
		while ((i <= 14) and (not endfile(f))) loop
			readline(f, l);
			--report l.all;
			read(l, b);
			t_mem(i) <= b;
			i := i + 1;
			this <= b;
			line_count := line_count + 1;
			wait for 10 ns;
		end loop;
		file_close(f);

		--initialize registers
		i := 0;
		while (i <= 31) loop
			registers(i) <= '0';
			i := i + 1;
		end loop;
		--loops through instructions
		i := 0; --line counter
		while (i<=line_count) loop			
			--fetch
			fdemw(0) := i;
			stages(0) <= '1';
			
			--decode
			if (fdemw(0) /= 0 & stall_flag = '0') then
				fdemw(1) := fdemw(0) - 1;
				stages(1) <= '1';
				instr := to_integer(unsigned(t_mem(fdemw(1))(0 to 2)));
				dst := to_integer(signed(t_mem(fdemw(1))(4 to 8)));
				src := to_integer(signed(t_mem(fdemw(1))(10 to 14)));
				tar := to_integer(signed(t_mem(fdemw(1))(16 to 20)));
				if t_mem(i)(3) = '0' then -- the first bit determines if the arg is a register or an immediate value
					if registers(dst) = '0' then --checks if register is avaiable
						if t_mem(i)(9) = '0' then
							if registers(src) = '0' then
								if (t_mem(i)(15) = '0' & instr /= 0) then
									if registers(tar) = '0' then
										registers(dst) <= '1'; --set the register to unavailable
										registers(src) <= '1'; --set the register to unavailable
										registesr(tar) <= '1'; --set the register to unavailable
									else
										stall_flag := '1';
									end if;
								else
									registers(dst) <= '1'; --set the register to unavailable
									registers(src) <= '1'; --set the register to unavailable
								end if;
							else
								stall_flag := '1';
							end if;
						else -- if second argument is an immediate value
							registers(dst) <= '1'; --set the register to unavailable
						end if;
					else
						stall_flag := '1';
					end if;
				end if;
			end if;

			--execute
			if fdemw(1) /= 0 then
				fdemw(2) := fdemw(1) - 1;
				instr := to_integer(unsigned(t_mem(fdemw(2))(0 to 2)));
				dst := to_integer(signed(t_mem(fdemw(2))(4 to 8)));
				src := to_integer(signed(t_mem(fdemw(2))(10 to 14)));
				tar := to_integer(signed(t_mem(fdemw(2))(16 to 20)));
				if instr = 0 then -- if instruction is LOAD
					
				elsif instr = 1 then -- if instructions is ADD

				elsif instr = 2 then -- if instruction is SUB

				elsif instr = 3 then -- if instruction is MUL

				elsif instr = 4 then -- if instruction is DIV

				elsif instr = 5 then -- if instruction is MOD

				end if;
			end if;

			--memory

			--writeback

			--set and reset register flags
			for j in 0 to 31 loop
				if fdemw(0) = reg_used_by(j) OR fdemw(1) = reg_used_by(j) OR fdemw(2) = reg_used_by(j) OR fdemw(3) = reg_used_by(j) OR fdemw(4) = reg_used_by(j) then
					registers(j) <= '1'; --set available
				else
					registers(j) <= '0'; --set unavailable
				end if;
			end loop;

			wait for 5 ns;

			if stall_flag = '1' then
				i := i - 1;
			end if;

			i := i + 1;
			program_counter <= std_logic_vector(unsigned(program_counter) + 1);
			wait for 5 ns;
		end loop;

		wait;
    end process;
end behav;