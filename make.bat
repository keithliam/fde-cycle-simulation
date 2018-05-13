title CS132 Project
ghdl -a --ieee=synopsys *.vhdl
ghdl -e --ieee=synopsys main
ghdl -r --ieee=synopsys main --vcd=main.vcd
gtkwave main.vcd
pause