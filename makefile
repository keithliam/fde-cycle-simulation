run:
	ghdl-0.35-llvm-macosx/bin/ghdl -a --ieee=synopsys main.vhdl
	ghdl-0.35-llvm-macosx/bin/ghdl -e --ieee=synopsys main
	ghdl-0.35-llvm-macosx/bin/ghdl -r --ieee=synopsys main

wave:
	ghdl-0.35-llvm-macosx/bin/ghdl -a --ieee=synopsys *.vhdl
	ghdl-0.35-llvm-macosx/bin/ghdl -e --ieee=synopsys main
	ghdl-0.35-llvm-macosx/bin/ghdl -r --ieee=synopsys main --vcd=main.vcd
	open ./main.vcd
