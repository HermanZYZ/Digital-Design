@echo off
set xv_path=E:\\Windows_Application\\Vivado\\Vivado\\2015.2\\bin
call %xv_path%/xelab  -wto f39e819627f242bbac8ca3aa868ab958 -m64 --debug typical --relax --mt 2 --maxdelay -L xil_defaultlib -L simprims_ver -L secureip --snapshot project_clock_time_impl -transport_int_delays -pulse_r 0 -pulse_int_r 0 xil_defaultlib.project_clock xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
