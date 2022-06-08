#Clock signal
create_clock -add -name sys_clk_pin -period 9.00 -waveform {0 4.5} [get_ports {clk}];