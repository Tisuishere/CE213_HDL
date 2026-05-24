transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {Lab5.vo}

vlog -vlog01compat -work work +incdir+D:/Study_project/HDL/Lab5 {D:/Study_project/HDL/Lab5/tb_Datapath.v}

vsim -t 1ps +transport_int_delays +transport_path_delays -L cycloneii_ver -L gate_work -L work -voptargs="+acc"  tb_Datapath

add wave *
view structure
view signals
run -all
