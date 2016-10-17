transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlib switchesqsys
vmap switchesqsys switchesqsys
vlog -vlog01compat -work switchesqsys +incdir+C:/Users/klholden/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules {C:/Users/klholden/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules/switchesqsys_nios2_processor_test_bench.v}
vlog -sv -work work +incdir+C:/Users/klholden/Documents/nightmares/ll11ll1lll1l1l_lab5 {C:/Users/klholden/Documents/nightmares/ll11ll1lll1l1l_lab5/readOutBuffer.sv}
