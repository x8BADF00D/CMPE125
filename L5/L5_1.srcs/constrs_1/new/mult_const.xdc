## Switches
set_property -dict {PACKAGE_PIN V17 IOSTANDARD LVCMOS33} [get_ports {in_1[0]}]; # Switch 0
set_property -dict {PACKAGE_PIN V16 IOSTANDARD LVCMOS33} [get_ports {in_1[1]}]; # Switch 1
set_property -dict {PACKAGE_PIN W16 IOSTANDARD LVCMOS33} [get_ports {in_1[2]}]; # Switch 2
set_property -dict {PACKAGE_PIN W17 IOSTANDARD LVCMOS33} [get_ports {in_1[3]}]; # Switch 3

set_property -dict {PACKAGE_PIN W2 IOSTANDARD LVCMOS33} [get_ports {in_2[12]}]; # Switch 12
set_property -dict {PACKAGE_PIN U1 IOSTANDARD LVCMOS33} [get_ports {in_2[13]}]; # Switch 13
set_property -dict {PACKAGE_PIN T1 IOSTANDARD LVCMOS33} [get_ports {in_2[14]}]; # Switch 14
set_property -dict {PACKAGE_PIN R2 IOSTANDARD LVCMOS33} [get_ports {in_2[15]}]; # Switch 15

## LEDs
set_property -dict {PACKAGE_PIN U16 IOSTANDARD LVCMOS33} [get_ports {led_in_1[0]}]; # LED 0
set_property -dict {PACKAGE_PIN E19 IOSTANDARD LVCMOS33} [get_ports {led_in_1[1]}]; # LED 1
set_property -dict {PACKAGE_PIN U19 IOSTANDARD LVCMOS33} [get_ports {led_in_1[2]}]; # LED 2
set_property -dict {PACKAGE_PIN V19 IOSTANDARD LVCMOS33} [get_ports {led_in_1[3]}]; # LED 3

set_property -dict {PACKAGE_PIN P3 IOSTANDARD LVCMOS33} [get_ports {led_in_2[12]}]; # LED 12
set_property -dict {PACKAGE_PIN N3 IOSTANDARD LVCMOS33} [get_ports {led_in_2[13]}]; # LED 13
set_property -dict {PACKAGE_PIN P1 IOSTANDARD LVCMOS33} [get_ports {led_in_2[14]}]; # LED 14
set_property -dict {PACKAGE_PIN L1 IOSTANDARD LVCMOS33} [get_ports {led_in_2[15]}]; # LED 15

set_property -dict {PACKAGE_PIN W18 IOSTANDARD LVCMOS33} [get_ports {led_out[4]}]; # LED 4
set_property -dict {PACKAGE_PIN U15 IOSTANDARD LVCMOS33} [get_ports {led_out[5]}]; # LED 5
set_property -dict {PACKAGE_PIN U14 IOSTANDARD LVCMOS33} [get_ports {led_out[6]}]; # LED 6
set_property -dict {PACKAGE_PIN V14 IOSTANDARD LVCMOS33} [get_ports {led_out[7]}]; # LED 7
set_property -dict {PACKAGE_PIN V13 IOSTANDARD LVCMOS33} [get_ports {led_out[8]}]; # LED 8
set_property -dict {PACKAGE_PIN V3 IOSTANDARD LVCMOS33} [get_ports {led_out[9]}]; # LED 9
set_property -dict {PACKAGE_PIN W3 IOSTANDARD LVCMOS33} [get_ports {led_out[10]}]; # LED 10
set_property -dict {PACKAGE_PIN U3 IOSTANDARD LVCMOS33} [get_ports {led_out[11]}]; # LED 11

## Buttons
set_property -dict {PACKAGE_PIN T18 IOSTANDARD LVCMOS33} [get_ports {btn_clk}]; # Top Button
set_property -dict {PACKAGE_PIN U17 IOSTANDARD LVCMOS33} [get_ports {btn_rst}]; # Botton Button