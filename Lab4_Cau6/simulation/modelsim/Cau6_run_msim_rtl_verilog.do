transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/HDL/Lab4/CAU6 {D:/HDL/Lab4/CAU6/sram_interface.v}
vlog -vlog01compat -work work +incdir+D:/HDL/Lab4/CAU6 {D:/HDL/Lab4/CAU6/hex_decoder.v}

vlog -vlog01compat -work work +incdir+D:/HDL/Lab4/CAU6 {D:/HDL/Lab4/CAU6/tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneii_ver -L rtl_work -L work -voptargs="+acc"  tb

add wave *
view structure
view signals
run -all
