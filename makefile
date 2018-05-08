run:
	ghdl-0.35-llvm-macosx/bin/ghdl -a *.vhdl
	ghdl-0.35-llvm-macosx/bin/ghdl -e main_tb
	ghdl-0.35-llvm-macosx/bin/ghdl -r main_tb --vcd=main_tb.vcd
	open ./main_tb.vcd
