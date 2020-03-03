transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Elec_374/Virtual-Processor {D:/Elec_374/Virtual-Processor/MD_Mux.v}
vlog -vlog01compat -work work +incdir+D:/Elec_374/Virtual-Processor {D:/Elec_374/Virtual-Processor/encoder_32_to_5.v}
vlog -vlog01compat -work work +incdir+D:/Elec_374/Virtual-Processor {D:/Elec_374/Virtual-Processor/Mux_32_to_1.v}
vlog -vlog01compat -work work +incdir+D:/Elec_374/Virtual-Processor {D:/Elec_374/Virtual-Processor/ALU.v}
vlog -vlog01compat -work work +incdir+D:/Elec_374/Virtual-Processor {D:/Elec_374/Virtual-Processor/REG32_MDR.v}
vlog -vlog01compat -work work +incdir+D:/Elec_374/Virtual-Processor {D:/Elec_374/Virtual-Processor/Datapath.v}

vlog -vlog01compat -work work +incdir+D:/Elec_374/Virtual-Processor {D:/Elec_374/Virtual-Processor/reg_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiii_ver -L rtl_work -L work -voptargs="+acc"  reg_tb

add wave *
view structure
view signals
run 1 sec
