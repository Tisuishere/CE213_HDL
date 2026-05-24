transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {Cau6.vo}

vlog -vlog01compat -work work +incdir+D:/HDL/Lab4/CAU6 {D:/HDL/Lab4/CAU6/tb.v}

vsim -t 1ps +transport_int_delays +transport_path_delays -L cycloneii_ver -L gate_work -L work -voptargs="+acc"  tb

add wave *
view structure
view signals
run -all
