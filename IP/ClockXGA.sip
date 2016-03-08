set_global_assignment -entity "ClockXGA" -library "lib_ClockXGA" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "ClockXGA" -library "lib_ClockXGA" -name IP_TOOL_VERSION "15.1"
set_global_assignment -entity "ClockXGA" -library "lib_ClockXGA" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_ClockXGA" -name SPD_FILE [file join $::quartus(sip_path) "ClockXGA.spd"]

set_global_assignment -library "lib_ClockXGA" -name MISC_FILE [file join $::quartus(sip_path) "ClockXGA_sim/ClockXGA.vo"]
