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
##              Peripheral-NTM for MPSoC                                         ##
##              Neural Turing Machine for MPSoC                                  ##
##                                                                               ##
###################################################################################

###################################################################################
##                                                                               ##
## Copyright (c) 2020-2024 by the author(s)                                      ##
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
##   Paco Reina Campo <pacoreinacampo@queenfield.tech>                           ##
##                                                                               ##
###################################################################################

##########################################################################
# Includes
##########################################################################

-include include-arithmetic.txt

TARGET=arithmetic_scalar

##########################################################################
# Targets
##########################################################################

all: x86 riscv or1k

x86:
	g++ main.cpp ${SOURCES_ARITHMETIC} -o ${TARGET}-x86.run

riscv:
	# Compilation. From State-Feedback source code to ELF
	riscv64-unknown-elf-g++ -std=c++11 -o ${TARGET}-riscv.elf main.cpp ${SOURCES_ARITHMETIC}
	# Conversion. From ELF to HEX
	riscv64-unknown-elf-objcopy -O ihex ${TARGET}-riscv.elf ${TARGET}-riscv.hex

or1k:
	# Compilation. From State-Feedback source code to ELF
	or1k-elf-g++ -std=c++11 -o ${TARGET}-or1k.elf main.cpp ${SOURCES_ARITHMETIC}
	# Conversion. From ELF to HEX
	or1k-elf-objcopy -O ihex ${TARGET}-or1k.elf ${TARGET}-or1k.hex

clean:
	rm -rf *.run
	rm -rf *.elf
	rm -rf *.hex
