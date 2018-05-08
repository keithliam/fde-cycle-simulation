run:
	ghdl-0.35-llvm-macosx\ 2/bin/ghdl -a *.vhdl
	ghdl-0.35-llvm-macosx\ 2/bin/ghdl -e cs132_tb
	ghdl-0.35-llvm-macosx\ 2/bin/ghdl -r cs132_tb --vcd=cs132_tb.vcd
	open ./cs132_tb.vcd
