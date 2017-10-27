# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35ticpg236-1L

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/ZYZ/Desktop/CCCCC/VGA_test/project_1.cache/wt [current_project]
set_property parent.project_path C:/Users/ZYZ/Desktop/CCCCC/VGA_test/project_1.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_cache_permissions disable [current_project]
read_verilog -library xil_defaultlib C:/Users/ZYZ/Desktop/CCCCC/VGA_test/project_1.srcs/sources_1/new/project_clock.v
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/ZYZ/Desktop/CCCCC/VGA_test/project_1.srcs/constrs_1/new/Project_Clock.xdc
set_property used_in_implementation false [get_files C:/Users/ZYZ/Desktop/CCCCC/VGA_test/project_1.srcs/constrs_1/new/Project_Clock.xdc]


synth_design -top vga_controller -part xc7a35ticpg236-1L


write_checkpoint -force -noxdef vga_controller.dcp

catch { report_utilization -file vga_controller_utilization_synth.rpt -pb vga_controller_utilization_synth.pb }
