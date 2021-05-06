# Input Switches

set_property -dict {PACKAGE_PIN V17 IOSTANDARD LVCMOS33} [get_ports {a[0]}];  # Switch 0
set_property -dict {PACKAGE_PIN V16 IOSTANDARD LVCMOS33} [get_ports {a[1]}];  # Switch 1
set_property -dict {PACKAGE_PIN W16 IOSTANDARD LVCMOS33} [get_ports {a[2]}];  # Switch 2
set_property -dict {PACKAGE_PIN W17 IOSTANDARD LVCMOS33} [get_ports {a[3]}];  # Switch 3
set_property -dict {PACKAGE_PIN W15 IOSTANDARD LVCMOS33} [get_ports {a[4]}];  # Switch 4
set_property -dict {PACKAGE_PIN V15 IOSTANDARD LVCMOS33} [get_ports {a[5]}];  # Switch 5
set_property -dict {PACKAGE_PIN W14 IOSTANDARD LVCMOS33} [get_ports {a[6]}];  # Switch 6
set_property -dict {PACKAGE_PIN W13 IOSTANDARD LVCMOS33} [get_ports {a[7]}];  # Switch 7

# Output LED
set_property -dict {PACKAGE_PIN U16 IOSTANDARD LVCMOS33} [get_ports {y[0]}];  # LED 0
set_property -dict {PACKAGE_PIN E19 IOSTANDARD LVCMOS33} [get_ports {y[1]}];  # LED 1
set_property -dict {PACKAGE_PIN U19 IOSTANDARD LVCMOS33} [get_ports {y[2]}];  # LED 2

# Output Valid Bit LED
set_property -dict {PACKAGE_PIN W18 IOSTANDARD LVCMOS33} [get_ports {valid}];  # LED 4
