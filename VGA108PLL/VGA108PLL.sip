set_global_assignment -entity "VGA108PLL" -library "lib_VGA108PLL" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "VGA108PLL" -library "lib_VGA108PLL" -name IP_TOOL_VERSION "15.1"
set_global_assignment -entity "VGA108PLL" -library "lib_VGA108PLL" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_VGA108PLL" -name SPD_FILE [file join $::quartus(sip_path) "VGA108PLL.spd"]

set_global_assignment -library "lib_VGA108PLL" -name MISC_FILE [file join $::quartus(sip_path) "VGA108PLL_sim/VGA108PLL.vo"]
