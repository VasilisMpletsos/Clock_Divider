# INITIALIZE

set_attribute lib_search_path /software/cadence/gsclib045_svt_v4.4/gsclib045/timing/ 
set_attribute library fast_vdd1v0_basicCells.lib

set_attr hdl_vhdl_read_version 1993
read_hdl -v2001 main_code_clock.v


# ELABORATE

elaborate

# APPLY CONSTRAINTS

define_clock -period 10 -name clk

# SYNTHESIZE

synthesize -to_mapped
write_hdl clk_div > clk_div_syn.v


# REPORT

write_sdc > sdc_clk_div.sdc
write_sdf -timescale ns > sdf_clk_div.sdf 



write_encounter design -basename ./clk_div_syn -lef "/software/cadence/gsclib045_svt_v4.4/gsclib045/lef/gsclib045_tech.lef"
gui_show;
