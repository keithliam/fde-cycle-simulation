run:
	ghdl -a --ieee=synopsys main.vhdl
	ghdl -e --ieee=synopsys main
	ghdl -r --ieee=synopsys main

wave:
	ghdl -a --ieee=synopsys *.vhdl
	ghdl -e --ieee=synopsys main
	ghdl -r --ieee=synopsys main --vcd=main.vcd
	open ./main.vcd

mac-run:
	ghdl-0.35-llvm-macosx/bin/ghdl -a --ieee=synopsys main.vhdl
	ghdl-0.35-llvm-macosx/bin/ghdl -e --ieee=synopsys main
	ghdl-0.35-llvm-macosx/bin/ghdl -r --ieee=synopsys main

mac-wave:
	ghdl-0.35-llvm-macosx/bin/ghdl -a --ieee=synopsys *.vhdl
	ghdl-0.35-llvm-macosx/bin/ghdl -e --ieee=synopsys main
	ghdl-0.35-llvm-macosx/bin/ghdl -r --ieee=synopsys main --vcd=main.vcd
	open ./main.vcd
