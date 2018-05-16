# FDE Cycle VHDL Simulation

## How to run

* For Ubuntu
	```console
	$ make run
	```
* For Windows
	Using the Command Prompt, enter the following:
	```console
	$ ghdl -a --ieee=synopsys main.vhdl
	$ ghdl -e --ieee=synopsys main
	$ ghdl -r --ieee=synopsys main
	```
* For MacOS
	```console
	$ make mac-run
	```

## GHDL Installation

* For Ubuntu
	```$ sudo apt-get install ghdl```
* For Windows 10
	1. Download the GHDL 0.35 binary file at GitHub by clicking on [this link](https://github.com/ghdl/ghdl/releases/download/v0.35/ghdl-0.35-mcode-windows.zip).
	2. Extract the files to the `fde-cycle-simulation` folder.
	4. Open Settings (of Windows).
	5. Search for `Edit the system environment variables` and click on the result.
	6. Under the `Advanced` tab, click on `Environment Variables`.
	7. Edit `Path` under `System variables`.
	8. Click on `Browse` and navigate to the extracted GHDL folder.
	9. Choose the folder `bin` inside the GHDL folder and click `OK`.
