## Clock Signal (100 MHz Onboard Oscillator)
set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { clk }];
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports { clk }];

## Push Buttons
set_property -dict { PACKAGE_PIN J2    IOSTANDARD LVCMOS33 } [get_ports { reset }];       # BTN0: System Reset
set_property -dict { PACKAGE_PIN J1    IOSTANDARD LVCMOS33 } [get_ports { btn_store_a }]; # BTN1: Store Register A
set_property -dict { PACKAGE_PIN G2    IOSTANDARD LVCMOS33 } [get_ports { btn_execute }]; # BTN2: Execute / Store Result

## Switches (Input Data: SW[0] to SW[7])
set_property -dict { PACKAGE_PIN V2    IOSTANDARD LVCMOS33 } [get_ports { switch_in[0] }];
set_property -dict { PACKAGE_PIN U2    IOSTANDARD LVCMOS33 } [get_ports { switch_in[1] }];
set_property -dict { PACKAGE_PIN U1    IOSTANDARD LVCMOS33 } [get_ports { switch_in[2] }];
set_property -dict { PACKAGE_PIN T2    IOSTANDARD LVCMOS33 } [get_ports { switch_in[3] }];
set_property -dict { PACKAGE_PIN T1    IOSTANDARD LVCMOS33 } [get_ports { switch_in[4] }];
set_property -dict { PACKAGE_PIN R2    IOSTANDARD LVCMOS33 } [get_ports { switch_in[5] }];
set_property -dict { PACKAGE_PIN R1    IOSTANDARD LVCMOS33 } [get_ports { switch_in[6] }];
set_property -dict { PACKAGE_PIN P2    IOSTANDARD LVCMOS33 } [get_ports { switch_in[7] }];

## Switches (ALU Opcode Select: SW[14] and SW[15])
set_property -dict { PACKAGE_PIN M2    IOSTANDARD LVCMOS33 } [get_ports { op_select[0] }]; # SW14
set_property -dict { PACKAGE_PIN M1    IOSTANDARD LVCMOS33 } [get_ports { op_select[1] }]; # SW15

## 7-Segment Display Cathodes (display_seg[0] to display_seg[6])
set_property -dict { PACKAGE_PIN D7    IOSTANDARD LVCMOS33 } [get_ports { display_seg[0] }]; # CA
set_property -dict { PACKAGE_PIN C7    IOSTANDARD LVCMOS33 } [get_ports { display_seg[1] }]; # CB
set_property -dict { PACKAGE_PIN A5    IOSTANDARD LVCMOS33 } [get_ports { display_seg[2] }]; # CC
set_property -dict { PACKAGE_PIN B5    IOSTANDARD LVCMOS33 } [get_ports { display_seg[3] }]; # CD
set_property -dict { PACKAGE_PIN A7    IOSTANDARD LVCMOS33 } [get_ports { display_seg[4] }]; # CE
set_property -dict { PACKAGE_PIN A6    IOSTANDARD LVCMOS33 } [get_ports { display_seg[5] }]; # CF
set_property -dict { PACKAGE_PIN B7    IOSTANDARD LVCMOS33 } [get_ports { display_seg[6] }]; # CG

## 7-Segment Display Anodes / Digit Enables (display_an[0] to display_an[3])
set_property -dict { PACKAGE_PIN C3    IOSTANDARD LVCMOS33 } [get_ports { display_an[0] }]; # AN0 (Rightmost active)
set_property -dict { PACKAGE_PIN C2    IOSTANDARD LVCMOS33 } [get_ports { display_an[1] }]; # AN1
set_property -dict { PACKAGE_PIN B1    IOSTANDARD LVCMOS33 } [get_ports { display_an[2] }]; # AN2
set_property -dict { PACKAGE_PIN C1    IOSTANDARD LVCMOS33 } [get_ports { display_an[3] }]; # AN3