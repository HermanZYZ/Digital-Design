@echo off
set xv_path=E:\\Windows_Application\\Vivado\\Vivado\\2015.2\\bin
call %xv_path%/xsim project_clock_time_impl -key {Post-Implementation:sim_1:Timing:project_clock} -tclbatch project_clock.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
