
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name Practica_Multiplicador -dir "/home/ise/Desktop/Practica_Multiplicador/planAhead_run_3" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "multiplicador.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {multiplicador.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top multiplicador $srcset
add_files [list {multiplicador.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4
