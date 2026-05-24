transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Study_project/HDL/Lab4_New {D:/Study_project/HDL/Lab4_New/ALU_32bit.v}

vlog -vlog01compat -work work +incdir+D:/Study_project/HDL/Lab4_New {D:/Study_project/HDL/Lab4_New/tb_ALU_32bit.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneii_ver -L rtl_work -L work -voptargs="+acc"  tb_ALU_32bit

add wave *
view structure
view signals
run -all
