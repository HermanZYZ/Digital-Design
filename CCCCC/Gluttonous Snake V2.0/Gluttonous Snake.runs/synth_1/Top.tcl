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
set_property webtalk.parent_dir {C:/Users/ZYZ/Desktop/CCCCC/Gluttonous Snake V2.0/Gluttonous Snake.cache/wt} [current_project]
set_property parent.project_path {C:/Users/ZYZ/Desktop/CCCCC/Gluttonous Snake V2.0/Gluttonous Snake.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_cache_permissions disable [current_project]
read_verilog -library xil_defaultlib {
  {C:/Users/ZYZ/Desktop/CCCCC/Gluttonous Snake V2.0/codes/Snake_Control.v}
  {C:/Users/ZYZ/Desktop/CCCCC/Gluttonous Snake V2.0/codes/Display.v}
  {C:/Users/ZYZ/Desktop/CCCCC/Gluttonous Snake V2.0/codes/EatingApple.v}
  {C:/Users/ZYZ/Desktop/CCCCC/Gluttonous Snake V2.0/codes/vga_controller.v}
  {C:/Users/ZYZ/Desktop/CCCCC/Gluttonous Snake V2.0/codes/Clock_divide.v}
  {C:/Users/ZYZ/Desktop/CCCCC/Gluttonous Snake V2.0/codes/Button_Scan.v}
  {C:/Users/ZYZ/Desktop/CCCCC/Gluttonous Snake V2.0/codes/Game_Control.v}
  {C:/Users/ZYZ/Desktop/CCCCC/Gluttonous Snake V2.0/codes/Top.v}
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc {{C:/Users/ZYZ/Desktop/CCCCC/Gluttonous Snake V2.0/Gluttonous Snake.srcs/constrs_2/new/Glu_Snake.xdc}}
set_property used_in_implementation false [get_files {{C:/Users/ZYZ/Desktop/CCCCC/Gluttonous Snake V2.0/Gluttonous Snake.srcs/constrs_2/new/Glu_Snake.xdc}}]


synth_design -top Top -part xc7a35ticpg236-1L


write_checkpoint -force -noxdef Top.dcp

catch { report_utilization -file Top_utilization_synth.rpt -pb Top_utilization_synth.pb }
