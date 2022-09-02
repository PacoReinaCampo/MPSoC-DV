###################################################################################
##                                            __ _      _     _                  ##
##                                           / _(_)    | |   | |                 ##
##                __ _ _   _  ___  ___ _ __ | |_ _  ___| | __| |                 ##
##               / _` | | | |/ _ \/ _ \ '_ \|  _| |/ _ \ |/ _` |                 ##
##              | (_| | |_| |  __/  __/ | | | | | |  __/ | (_| |                 ##
##               \__, |\__,_|\___|\___|_| |_|_| |_|\___|_|\__,_|                 ##
##                  | |                                                          ##
##                  |_|                                                          ##
##                                                                               ##
##                                                                               ##
##              MPSoC-SPRAM CPU                                                  ##
##              Synthesis Test Makefile                                          ##
##                                                                               ##
###################################################################################

###################################################################################
##                                                                               ##
## Copyright (c) 2018-2019 by the author(s)                                      ##
##                                                                               ##
## Permission is hereby granted, free of charge, to any person obtaining a copy  ##
## of this software and associated documentation files (the "Software"), to deal ##
## in the Software without restriction, including without limitation the rights  ##
## to use, copy, modify, merge, publish, distribute, sublicense, and/or sell     ##
## copies of the Software, and to permit persons to whom the Software is         ##
## furnished to do so, subject to the following conditions:                      ##
##                                                                               ##
## The above copyright notice and this permission notice shall be included in    ##
## all copies or substantial portions of the Software.                           ##
##                                                                               ##
## THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR    ##
## IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,      ##
## FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE   ##
## AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER        ##
## LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, ##
## OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN     ##
## THE SOFTWARE.                                                                 ##
##                                                                               ##
## ============================================================================= ##
## Author(s):                                                                    ##
##   Francisco Javier Reina Campo <frareicam@gmail.com>                          ##
##                                                                               ##
###################################################################################

# ----------------------------------------------------------------------------
# Audio Codec - Bank 13
# ---------------------------------------------------------------------------- 
#set_property PACKAGE_PIN AB1 [get_ports {AC_ADR0}];  # "AC-ADR0"
#set_property PACKAGE_PIN Y5  [get_ports {AC_ADR1}];  # "AC-ADR1"
#set_property PACKAGE_PIN Y8  [get_ports {SDATA_O}];  # "AC-GPIO0"
#set_property PACKAGE_PIN AA7 [get_ports {SDATA_I}];  # "AC-GPIO1"
#set_property PACKAGE_PIN AA6 [get_ports {BCLK_O}];  # "AC-GPIO2"
#set_property PACKAGE_PIN Y6  [get_ports {LRCLK_O}];  # "AC-GPIO3"
#set_property PACKAGE_PIN AB2 [get_ports {MCLK_O}];  # "AC-MCLK"
#set_property PACKAGE_PIN AB4 [get_ports {iic_rtl_scl_io}];  # "AC-SCK"
#set_property PACKAGE_PIN AB5 [get_ports {iic_rtl_sda_io}];  # "AC-SDA"

# ----------------------------------------------------------------------------
# Clock Source - Bank 13
# ---------------------------------------------------------------------------- 
set_property PACKAGE_PIN Y9 [get_ports {HCLK}];  # "GCLK"

# ----------------------------------------------------------------------------
# JA Pmod - Bank 13 
# ---------------------------------------------------------------------------- 
set_property PACKAGE_PIN Y11  [get_ports {HADDR[0]}];  # "JA1"
set_property PACKAGE_PIN AA8  [get_ports {HADDR[1]}];  # "JA10"
set_property PACKAGE_PIN AA11 [get_ports {HADDR[2]}];  # "JA2"
set_property PACKAGE_PIN Y10  [get_ports {HADDR[3]}];  # "JA3"
set_property PACKAGE_PIN AA9  [get_ports {HADDR[4]}];  # "JA4"
set_property PACKAGE_PIN AB11 [get_ports {HADDR[5]}];  # "JA7"
set_property PACKAGE_PIN AB10 [get_ports {HADDR[6]}];  # "JA8"
set_property PACKAGE_PIN AB9  [get_ports {HADDR[7]}];  # "JA9"

# ----------------------------------------------------------------------------
# JB Pmod - Bank 13
# ---------------------------------------------------------------------------- 
set_property PACKAGE_PIN W12 [get_ports {HRESETn}];  # "JB1"
set_property PACKAGE_PIN W11 [get_ports {HSEL}];  # "JB2"
set_property PACKAGE_PIN V10 [get_ports {HWRITE}];  # "JB3"
set_property PACKAGE_PIN W8 [get_ports {HSIZE[0]}];  # "JB4"
set_property PACKAGE_PIN V12 [get_ports {HSIZE[1]}];  # "JB7"
set_property PACKAGE_PIN W10 [get_ports {HSIZE[2]}];  # "JB8"
set_property PACKAGE_PIN V9 [get_ports {HTRANS[0]}];  # "JB9"
set_property PACKAGE_PIN V8 [get_ports {HTRANS[1]}];  # "JB10"

# ----------------------------------------------------------------------------
# JC Pmod - Bank 13
# ---------------------------------------------------------------------------- 
set_property PACKAGE_PIN AB6 [get_ports {HBURST[0]}];  # "JC1_N"
set_property PACKAGE_PIN AB7 [get_ports {HBURST[1]}];  # "JC1_P"
set_property PACKAGE_PIN AA4 [get_ports {HBURST[2]}];  # "JC2_N"
set_property PACKAGE_PIN Y4  [get_ports {HPROT[0]}];  # "JC2_P"
set_property PACKAGE_PIN T6  [get_ports {HPROT[1]}];  # "JC3_N"
set_property PACKAGE_PIN R6  [get_ports {HPROT[2]}];  # "JC3_P"
set_property PACKAGE_PIN U4  [get_ports {HMASTLOCK}];  # "JC4_N"
set_property PACKAGE_PIN T4  [get_ports {HREADYOUT}];  # "JC4_P"

# ----------------------------------------------------------------------------
# JD Pmod - Bank 13
# ---------------------------------------------------------------------------- 
set_property PACKAGE_PIN W7 [get_ports {HREADY}];  # "JD1_N"
set_property PACKAGE_PIN V7 [get_ports {HRESP}];  # "JD1_P"
#set_property PACKAGE_PIN V4 [get_ports {JD2_N}];  # "JD2_N"
#set_property PACKAGE_PIN V5 [get_ports {JD2_P}];  # "JD2_P"
#set_property PACKAGE_PIN W5 [get_ports {JD3_N}];  # "JD3_N"
#set_property PACKAGE_PIN W6 [get_ports {JD3_P}];  # "JD3_P"
#set_property PACKAGE_PIN U5 [get_ports {JD4_N}];  # "JD4_N"
#set_property PACKAGE_PIN U6 [get_ports {JD4_P}];  # "JD4_P"

# ----------------------------------------------------------------------------
# OLED Display - Bank 13
# ---------------------------------------------------------------------------- 
#set_property PACKAGE_PIN U10  [get_ports {OLED_DC}];  # "OLED-DC"
#set_property PACKAGE_PIN U9   [get_ports {OLED_RES}];  # "OLED-RES"
#set_property PACKAGE_PIN AB12 [get_ports {OLED_SCLK}];  # "OLED-SCLK"
#set_property PACKAGE_PIN AA12 [get_ports {OLED_SDIN}];  # "OLED-SDIN"
#set_property PACKAGE_PIN U11  [get_ports {OLED_VBAT}];  # "OLED-VBAT"
#set_property PACKAGE_PIN U12  [get_ports {OLED_VDD}];  # "OLED-VDD"

# ----------------------------------------------------------------------------
# HDMI Output - Bank 33
# ---------------------------------------------------------------------------- 
#set_property PACKAGE_PIN W18  [get_ports {HD_CLK}];  # "HD-CLK"
#set_property PACKAGE_PIN Y13  [get_ports {HD_D0}];  # "HD-D0"
#set_property PACKAGE_PIN AA13 [get_ports {HD_D1}];  # "HD-D1"
#set_property PACKAGE_PIN W13  [get_ports {HD_D10}];  # "HD-D10"
#set_property PACKAGE_PIN W15  [get_ports {HD_D11}];  # "HD-D11"
#set_property PACKAGE_PIN V15  [get_ports {HD_D12}];  # "HD-D12"
#set_property PACKAGE_PIN U17  [get_ports {HD_D13}];  # "HD-D13"
#set_property PACKAGE_PIN V14  [get_ports {HD_D14}];  # "HD-D14"
#set_property PACKAGE_PIN V13  [get_ports {HS_D15}];  # "HD-D15"
#set_property PACKAGE_PIN AA14 [get_ports {HD_D2}];  # "HD-D2"
#set_property PACKAGE_PIN Y14  [get_ports {HD_D3}];  # "HD-D3"
#set_property PACKAGE_PIN AB15 [get_ports {HD_D4}];  # "HD-D4"
#set_property PACKAGE_PIN AB16 [get_ports {HD_D5}];  # "HD-D5"
#set_property PACKAGE_PIN AA16 [get_ports {HD_D6}];  # "HD-D6"
#set_property PACKAGE_PIN AB17 [get_ports {HD_D7}];  # "HD-D7"
#set_property PACKAGE_PIN AA17 [get_ports {HD_D8}];  # "HD-D8"
#set_property PACKAGE_PIN Y15  [get_ports {HD_D9}];  # "HD-D9"
#set_property PACKAGE_PIN U16  [get_ports {HD_DE}];  # "HD-DE"
#set_property PACKAGE_PIN V17  [get_ports {HD_HSYNC}];  # "HD-HSYNC"
#set_property PACKAGE_PIN W16  [get_ports {HD_INT}];  # "HD-INT"
#set_property PACKAGE_PIN AA18 [get_ports {HD_SCL}];  # "HD-SCL"
#set_property PACKAGE_PIN Y16  [get_ports {HD_SDA}];  # "HD-SDA"
#set_property PACKAGE_PIN U15  [get_ports {HD_SPDIF}];  # "HD-SPDIF"
#set_property PACKAGE_PIN Y18  [get_ports {HD_SPDIFO}];  # "HD-SPDIFO"
#set_property PACKAGE_PIN W17  [get_ports {HD_VSYNC}];  # "HD-VSYNC"

# ----------------------------------------------------------------------------
# User LEDs - Bank 33
# ---------------------------------------------------------------------------- 
#set_property PACKAGE_PIN T22 [get_ports {LD0}];  # "LD0"
#set_property PACKAGE_PIN T21 [get_ports {LD1}];  # "LD1"
#set_property PACKAGE_PIN U22 [get_ports {LD2}];  # "LD2"
#set_property PACKAGE_PIN U21 [get_ports {LD3}];  # "LD3"
#set_property PACKAGE_PIN V22 [get_ports {LD4}];  # "LD4"
#set_property PACKAGE_PIN W22 [get_ports {LD5}];  # "LD5"
#set_property PACKAGE_PIN U19 [get_ports {LD6}];  # "LD6"
#set_property PACKAGE_PIN U14 [get_ports {LD7}];  # "LD7"

# ----------------------------------------------------------------------------
# VGA Output - Bank 33
# ---------------------------------------------------------------------------- 
#set_property PACKAGE_PIN Y21  [get_ports {VGA_B1}];  # "VGA-B1"
#set_property PACKAGE_PIN Y20  [get_ports {VGA_B2}];  # "VGA-B2"
#set_property PACKAGE_PIN AB20 [get_ports {VGA_B3}];  # "VGA-B3"
#set_property PACKAGE_PIN AB19 [get_ports {VGA_B4}];  # "VGA-B4"
#set_property PACKAGE_PIN AB22 [get_ports {VGA_G1}];  # "VGA-G1"
#set_property PACKAGE_PIN AA22 [get_ports {VGA_G2}];  # "VGA-G2"
#set_property PACKAGE_PIN AB21 [get_ports {VGA_G3}];  # "VGA-G3"
#set_property PACKAGE_PIN AA21 [get_ports {VGA_G4}];  # "VGA-G4"
#set_property PACKAGE_PIN AA19 [get_ports {VGA_HS}];  # "VGA-HS"
#set_property PACKAGE_PIN V20  [get_ports {VGA_R1}];  # "VGA-R1"
#set_property PACKAGE_PIN U20  [get_ports {VGA_R2}];  # "VGA-R2"
#set_property PACKAGE_PIN V19  [get_ports {VGA_R3}];  # "VGA-R3"
#set_property PACKAGE_PIN V18  [get_ports {VGA_R4}];  # "VGA-R4"
#set_property PACKAGE_PIN Y19  [get_ports {VGA_VS}];  # "VGA-VS"

# ----------------------------------------------------------------------------
# User Push Buttons - Bank 34
# ---------------------------------------------------------------------------- 
#set_property PACKAGE_PIN P16 [get_ports {BTNC}];  # "BTNC"
#set_property PACKAGE_PIN R16 [get_ports {BTND}];  # "BTND"
#set_property PACKAGE_PIN N15 [get_ports {BTNL}];  # "BTNL"
#set_property PACKAGE_PIN R18 [get_ports {BTNR}];  # "BTNR"
#set_property PACKAGE_PIN T18 [get_ports {BTNU}];  # "BTNU"

# ----------------------------------------------------------------------------
# USB OTG Reset - Bank 34
# ---------------------------------------------------------------------------- 
#set_property PACKAGE_PIN L16 [get_ports {OTG_VBUSOC}];  # "OTG-VBUSOC"

# ----------------------------------------------------------------------------
# XADC GIO - Bank 34
# ---------------------------------------------------------------------------- 
#set_property PACKAGE_PIN H15 [get_ports {XADC_GIO0}];  # "XADC-GIO0"
#set_property PACKAGE_PIN R15 [get_ports {XADC_GIO1}];  # "XADC-GIO1"
#set_property PACKAGE_PIN K15 [get_ports {XADC_GIO2}];  # "XADC-GIO2"
#set_property PACKAGE_PIN J15 [get_ports {XADC_GIO3}];  # "XADC-GIO3"

# ----------------------------------------------------------------------------
# Miscellaneous - Bank 34
# ---------------------------------------------------------------------------- 
#set_property PACKAGE_PIN K16 [get_ports {PUDC_B}];  # "PUDC_B"

## ----------------------------------------------------------------------------
## USB OTG Reset - Bank 35
## ---------------------------------------------------------------------------- 
#set_property PACKAGE_PIN G17 [get_ports {OTG_RESETN}];  # "OTG-RESETN"

## ----------------------------------------------------------------------------
## User DIP Switches - Bank 35
## ---------------------------------------------------------------------------- 
#set_property PACKAGE_PIN F22 [get_ports {SW0}];  # "SW0"
#set_property PACKAGE_PIN G22 [get_ports {SW1}];  # "SW1"
#set_property PACKAGE_PIN H22 [get_ports {SW2}];  # "SW2"
#set_property PACKAGE_PIN F21 [get_ports {SW3}];  # "SW3"
#set_property PACKAGE_PIN H19 [get_ports {SW4}];  # "SW4"
#set_property PACKAGE_PIN H18 [get_ports {SW5}];  # "SW5"
#set_property PACKAGE_PIN H17 [get_ports {SW6}];  # "SW6"
#set_property PACKAGE_PIN M15 [get_ports {SW7}];  # "SW7"

## ----------------------------------------------------------------------------
## XADC AD Channels - Bank 35
## ---------------------------------------------------------------------------- 
#set_property PACKAGE_PIN E16 [get_ports {AD0N_R}];  # "XADC-AD0N-R"
#set_property PACKAGE_PIN F16 [get_ports {AD0P_R}];  # "XADC-AD0P-R"
#set_property PACKAGE_PIN D17 [get_ports {AD8N_N}];  # "XADC-AD8N-R"
#set_property PACKAGE_PIN D16 [get_ports {AD8P_R}];  # "XADC-AD8P-R"

## ----------------------------------------------------------------------------
## FMC Expansion Connector - Bank 13
## ---------------------------------------------------------------------------- 
#set_property PACKAGE_PIN R7 [get_ports {FMC_SCL}];  # "FMC-SCL"
#set_property PACKAGE_PIN U7 [get_ports {FMC_SDA}];  # "FMC-SDA"

## ----------------------------------------------------------------------------
## FMC Expansion Connector - Bank 33
## ---------------------------------------------------------------------------- 
#set_property PACKAGE_PIN AB14 [get_ports {FMC_PRSNT}];  # "FMC-PRSNT"

## ----------------------------------------------------------------------------
## FMC Expansion Connector - Bank 34
## ---------------------------------------------------------------------------- 
#set_property PACKAGE_PIN L19 [get_ports {FMC_CLK0_N}];  # "FMC-CLK0_N"
#set_property PACKAGE_PIN L18 [get_ports {FMC_CLK0_P}];  # "FMC-CLK0_P"
#set_property PACKAGE_PIN M20 [get_ports {FMC_LA00_CC_N}];  # "FMC-LA00_CC_N"
#set_property PACKAGE_PIN M19 [get_ports {FMC_LA00_CC_P}];  # "FMC-LA00_CC_P"
set_property PACKAGE_PIN N20 [get_ports {HWDATA[0]}];  # "FMC-LA01_CC_N"
set_property PACKAGE_PIN N19 [get_ports {HWDATA[1]}];  # "FMC-LA01_CC_P" - corrected 6/6/16 GE
set_property PACKAGE_PIN P18 [get_ports {HWDATA[2]}];  # "FMC-LA02_N"
set_property PACKAGE_PIN P17 [get_ports {HWDATA[3]}];  # "FMC-LA02_P"
set_property PACKAGE_PIN P22 [get_ports {HWDATA[4]}];  # "FMC-LA03_N"
set_property PACKAGE_PIN N22 [get_ports {HWDATA[5]}];  # "FMC-LA03_P"
set_property PACKAGE_PIN M22 [get_ports {HWDATA[6]}];  # "FMC-LA04_N"
set_property PACKAGE_PIN M21 [get_ports {HWDATA[7]}];  # "FMC-LA04_P"
set_property PACKAGE_PIN K18 [get_ports {HWDATA[8]}];  # "FMC-LA05_N"
set_property PACKAGE_PIN J18 [get_ports {HWDATA[9]}];  # "FMC-LA05_P"
set_property PACKAGE_PIN L22 [get_ports {HWDATA[10]}];  # "FMC-LA06_N"
set_property PACKAGE_PIN L21 [get_ports {HWDATA[11]}];  # "FMC-LA06_P"
set_property PACKAGE_PIN T17 [get_ports {HWDATA[12]}];  # "FMC-LA07_N"
set_property PACKAGE_PIN T16 [get_ports {HWDATA[13]}];  # "FMC-LA07_P"
set_property PACKAGE_PIN J22 [get_ports {HWDATA[14]}];  # "FMC-LA08_N"
set_property PACKAGE_PIN J21 [get_ports {HWDATA[15]}];  # "FMC-LA08_P"
set_property PACKAGE_PIN R21 [get_ports {HWDATA[16]}];  # "FMC-LA09_N"
set_property PACKAGE_PIN R20 [get_ports {HWDATA[17]}];  # "FMC-LA09_P"
set_property PACKAGE_PIN T19 [get_ports {HWDATA[18]}];  # "FMC-LA10_N"
set_property PACKAGE_PIN R19 [get_ports {HWDATA[19]}];  # "FMC-LA10_P"
set_property PACKAGE_PIN N18 [get_ports {HWDATA[20]}];  # "FMC-LA11_N"
set_property PACKAGE_PIN N17 [get_ports {HWDATA[21]}];  # "FMC-LA11_P"
set_property PACKAGE_PIN P21 [get_ports {HWDATA[22]}];  # "FMC-LA12_N"
set_property PACKAGE_PIN P20 [get_ports {HWDATA[23]}];  # "FMC-LA12_P"
set_property PACKAGE_PIN M17 [get_ports {HWDATA[24]}];  # "FMC-LA13_N"
set_property PACKAGE_PIN L17 [get_ports {HWDATA[25]}];  # "FMC-LA13_P"
set_property PACKAGE_PIN K20 [get_ports {HWDATA[26]}];  # "FMC-LA14_N"
set_property PACKAGE_PIN K19 [get_ports {HWDATA[27]}];  # "FMC-LA14_P"
set_property PACKAGE_PIN J17 [get_ports {HWDATA[28]}];  # "FMC-LA15_N"
set_property PACKAGE_PIN J16 [get_ports {HWDATA[29]}];  # "FMC-LA15_P"
set_property PACKAGE_PIN K21 [get_ports {HWDATA[30]}];  # "FMC-LA16_N"
set_property PACKAGE_PIN J20 [get_ports {HWDATA[31]}];  # "FMC-LA16_P"

## ----------------------------------------------------------------------------
## FMC Expansion Connector - Bank 35
## ---------------------------------------------------------------------------- 
#set_property PACKAGE_PIN C19 [get_ports {FMC_CLK1_N}];  # "FMC-CLK1_N"
#set_property PACKAGE_PIN D18 [get_ports {FMC_CLK1_P}];  # "FMC-CLK1_P"
#set_property PACKAGE_PIN B20 [get_ports {FMC_LA17_CC_N}];  # "FMC-LA17_CC_N"
#set_property PACKAGE_PIN B19 [get_ports {FMC_LA17_CC_P}];  # "FMC-LA17_CC_P"
set_property PACKAGE_PIN C20 [get_ports {HRDATA[0]}];  # "FMC-LA18_CC_N"
set_property PACKAGE_PIN D20 [get_ports {HRDATA[1]}];  # "FMC-LA18_CC_P"
set_property PACKAGE_PIN G16 [get_ports {HRDATA[2]}];  # "FMC-LA19_N"
set_property PACKAGE_PIN G15 [get_ports {HRDATA[3]}];  # "FMC-LA19_P"
set_property PACKAGE_PIN G21 [get_ports {HRDATA[4]}];  # "FMC-LA20_N"
set_property PACKAGE_PIN G20 [get_ports {HRDATA[5]}];  # "FMC-LA20_P"
set_property PACKAGE_PIN E20 [get_ports {HRDATA[6]}];  # "FMC-LA21_N"
set_property PACKAGE_PIN E19 [get_ports {HRDATA[7]}];  # "FMC-LA21_P"
set_property PACKAGE_PIN F19 [get_ports {HRDATA[8]}];  # "FMC-LA22_N"
set_property PACKAGE_PIN G19 [get_ports {HRDATA[9]}];  # "FMC-LA22_P"
set_property PACKAGE_PIN D15 [get_ports {HRDATA[10]}];  # "FMC-LA23_N"
set_property PACKAGE_PIN E15 [get_ports {HRDATA[11]}];  # "FMC-LA23_P"
set_property PACKAGE_PIN A19 [get_ports {HRDATA[12]}];  # "FMC-LA24_N"
set_property PACKAGE_PIN A18 [get_ports {HRDATA[13]}];  # "FMC-LA24_P"
set_property PACKAGE_PIN C22 [get_ports {HRDATA[14]}];  # "FMC-LA25_N"
set_property PACKAGE_PIN D22 [get_ports {HRDATA[15]}];  # "FMC-LA25_P"
set_property PACKAGE_PIN E18 [get_ports {HRDATA[16]}];  # "FMC-LA26_N"
set_property PACKAGE_PIN F18 [get_ports {HRDATA[17]}];  # "FMC-LA26_P"
set_property PACKAGE_PIN D21 [get_ports {HRDATA[18]}];  # "FMC-LA27_N"
set_property PACKAGE_PIN E21 [get_ports {HRDATA[19]}];  # "FMC-LA27_P"
set_property PACKAGE_PIN A17 [get_ports {HRDATA[20]}];  # "FMC-LA28_N"
set_property PACKAGE_PIN A16 [get_ports {HRDATA[21]}];  # "FMC-LA28_P"
set_property PACKAGE_PIN C18 [get_ports {HRDATA[22]}];  # "FMC-LA29_N"
set_property PACKAGE_PIN C17 [get_ports {HRDATA[23]}];  # "FMC-LA29_P"
set_property PACKAGE_PIN B15 [get_ports {HRDATA[24]}];  # "FMC-LA30_N"
set_property PACKAGE_PIN C15 [get_ports {HRDATA[25]}];  # "FMC-LA30_P"
set_property PACKAGE_PIN B17 [get_ports {HRDATA[26]}];  # "FMC-LA31_N"
set_property PACKAGE_PIN B16 [get_ports {HRDATA[27]}];  # "FMC-LA31_P"
set_property PACKAGE_PIN A22 [get_ports {HRDATA[28]}];  # "FMC-LA32_N"
set_property PACKAGE_PIN A21 [get_ports {HRDATA[29]}];  # "FMC-LA32_P"
set_property PACKAGE_PIN B22 [get_ports {HRDATA[30]}];  # "FMC-LA33_N"
set_property PACKAGE_PIN B21 [get_ports {HRDATA[31]}];  # "FMC-LA33_P"

# ----------------------------------------------------------------------------
# IOSTANDARD Constraints
#
# Note that these IOSTANDARD constraints are applied to all IOs currently
# assigned within an I/O bank.  If these IOSTANDARD constraints are 
# evaluated prior to other PACKAGE_PIN constraints being applied, then 
# the IOSTANDARD specified will likely not be applied properly to those 
# pins.  Therefore, bank wide IOSTANDARD constraints should be placed 
# within the XDC file in a location that is evaluated AFTER all 
# PACKAGE_PIN constraints within the target bank have been evaluated.
#
# Un-comment one or more of the following IOSTANDARD constraints according to
# the bank pin assignments that are required within a design.
# ---------------------------------------------------------------------------- 

# Note that the bank voltage for IO Bank 33 is fixed to 3.3V on ZedBoard. 
set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 33]];

# Set the bank voltage for IO Bank 34 to 1.8V by default.
# set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 34]];
# set_property IOSTANDARD LVCMOS25 [get_ports -of_objects [get_iobanks 34]];
set_property IOSTANDARD LVCMOS18 [get_ports -of_objects [get_iobanks 34]];

# Set the bank voltage for IO Bank 35 to 1.8V by default.
# set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 35]];
# set_property IOSTANDARD LVCMOS25 [get_ports -of_objects [get_iobanks 35]];
set_property IOSTANDARD LVCMOS18 [get_ports -of_objects [get_iobanks 35]];

# Note that the bank voltage for IO Bank 13 is fixed to 3.3V on ZedBoard. 
set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 13]];
