transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {Lab4.vo}

vlog -vlog01compat -work work +incdir+D:/Study_project/HDL/Lab4_New {D:/Study_project/HDL/Lab4_New/tb_RegisterFile.v}

vsim -t 1ps +transport_int_delays +transport_path_delays -L cycloneii_ver -L gate_work -L work -voptargs="+acc"  tb_RegisterFile

add wave *
view structure
view signals
run -all
