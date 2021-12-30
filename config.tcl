# User config
set script_dir [file dirname [file normalize [info script]]]

# name of your project, should also match the name of the top module
set ::env(DESIGN_NAME) wrapped_hack_soc_dffram


# add your source files here
set ::env(VERILOG_FILES) "$::env(DESIGN_DIR)/wrapped_hack_soc_dffram.v \
    $::env(DESIGN_DIR)/hack_soc/src/*.v"


set ::env(VERILOG_INCLUDE_DIRS) "$::env(DESIGN_DIR)/hack_soc"


### Black-box verilog and views
#set ::env(VERILOG_FILES_BLACKBOX) "
# 	$::env(DESIGN_DIR)/macros/verilog/*.v"
set ::env(EXTRA_LEFS) [glob $::env(DESIGN_DIR)/macros/lef/*.lef]
set ::env(EXTRA_GDS_FILES) [glob $::env(DESIGN_DIR)/macros/gds/*.gds]

set ::env(MACRO_PLACEMENT_CFG) $::env(DESIGN_DIR)/macro_placement.cfg

set ::env(PDN_CFG) $::env(DESIGN_DIR)/pdn.tcl

set ::env(FP_HORIZONTAL_HALO) 5
# set ::env(FP_HORIZONTAL_HALO) 3
set ::env(FP_VERTICAL_HALO) 5


# set ::env(FP_PDN_VPITCH) 130
# set ::env(FP_PDN_VOFFSET) 5
# set ::env(FP_PDN_HOFFSET) 0
# set ::env(FP_PDN_HPITCH) 140


# target density, change this if you can't get your design to fit
set ::env(PL_TARGET_DENSITY) 0.6

# Cell padding; increases the width of cells. 
# (Default: 4 microns -- 4 sites)
set ::env(CELL_PAD) "0"

# Diode cell padding; increases the width of diode cells during placement checks.
# (Default: 2 microns -- 2 sites)
#set ::env(DIODE_PADDING) "2"


# set absolute size of the die to 300 x 300 um
set ::env(DIE_AREA) "0 0 392.25 398"
set ::env(FP_SIZING) absolute

# define number of IO pads
set ::env(SYNTH_DEFINES) "MPRJ_IO_PADS=38"

# clock period is ns
set ::env(CLOCK_PERIOD) "20"
set ::env(CLOCK_PORT) "wb_clk_i"

# macro needs to work inside Caravel, so can't be core and can't use metal 5
set ::env(DESIGN_IS_CORE) 0
set ::env(GLB_RT_MAXLAYER) 5
set ::env(GLB_RT_MINLAYER) 2


# define power straps so the macro works inside Caravel's PDN
set ::env(VDD_NETS) [list {vccd1}]
set ::env(GND_NETS) [list {vssd1}]
#set ::env(VDD_NETS) [list {vccd1} {vccd2} {vdda1} {vdda2}]
#set ::env(GND_NETS) [list {vssd1} {vssd2} {vssa1} {vssa2}]

# regular pin order seems to help with aggregating all the macros for the group project
#set ::env(FP_PIN_ORDER_CFG) $script_dir/pin_order.cfg

# turn off CVC as we have multiple power domains
set ::env(RUN_CVC) 0


set ::env(PL_RESIZER_BUFFER_OUTPUT_PORTS) 0


# save some time
set ::env(RUN_KLAYOUT_XOR) 0
set ::env(RUN_KLAYOUT_DRC) 0


set ::env(SYNTH_STRATEGY) "AREA 2"

# A flag that disables flattening the hierarchy during synthesis, only flattening it after synthesis, mapping and optimizations.
# Enabled = 1, Disabled = 0
#set ::env(SYNTH_NO_FLAT) 1

set ::env(PL_RESIZER_HOLD_SLACK_MARGIN) 0.2
set ::env(GLB_RESIZER_HOLD_SLACK_MARGIN) 0.2

set ::env(ROUTING_CORES) 8
#set ::env(ROUTING_OPT_ITERS) 80

#set ::env(BASE_SDC_FILE) "$::env(DESIGN_DIR)/wrapped_hack_soc.sdc"
# set ::env(SYNTH_DRIVING_CELL) "sky130_fd_sc_hd__inv_8"
# set ::env(SYNTH_DRIVING_CELL_PIN) "Y"


# Specifies the insertion strategy of diodes to be used in the flow. 0 = No diode insertion, 1 = Spray diodes, 2 = insert fake diodes and replace them with real diodes if needed. 3= use FastRoute Antenna Avoidance flow, 4 = Use Sylvian's Custom Script for diode insertion on design pins and smartly inserting needed diodes inside the design, 5 = a mix of strategy 2 and 4.
# (Default: 3)

# HAD TO ADD THIS AND CHANGED FROM 3 BECAUSE OF A BUG IN OPENROAD THAT CAUSES A SEGMENTATION FAULT.
# ONCE OPENROAD IS UPDATED I CAN TRY COMMENTING OUT THIS LINE
# set ::env(DIODE_INSERTION_STRATEGY) 0

set ::env(FP_PIN_ORDER_CFG)  "$::env(DESIGN_DIR)/pin_order.cfg"
#set ::env(LEFT_MARGIN_MULT) 20
#set ::env(RIGHT_MARGIN_MULT) 20
set ::env(FP_TAPCELL_DIST) 10
