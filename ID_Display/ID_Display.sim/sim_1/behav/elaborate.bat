@echo off
set xv_path=D:\\Xilinx\\Vivado\\2015.2\\bin
call %xv_path%/xelab  -wto bd22cf6d6e814875a89cad8864729b77 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot ID_behav xil_defaultlib.ID xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
