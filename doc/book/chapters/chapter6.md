# SOFTWARE WORKFLOW

## BACK-END OPEN SOURCE TOOLS

type:
```
sudo apt install autoconf automake autotools-dev curl python3 libmpc-dev \
libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf \
libtool patchutils bc zlib1g-dev libexpat-dev
```

### MSP430

#### MSP430 GNU C/C++
#### MSP430 GNU Go

### OpenRISC

#### OpenRISC GNU C/C++
#### OpenRISC GNU Go

### RISC-V

#### RISC-V GNU C/C++

type:
```
git clone --recursive https://github.com/riscv/riscv-gnu-toolchain

cd riscv-gnu-toolchain

./configure --prefix=/opt/riscv-elf-gcc
sudo make clean
sudo make

./configure --prefix=/opt/riscv-elf-gcc
sudo make clean
sudo make linux

./configure --prefix=/opt/riscv-elf-gcc --enable-multilib
sudo make clean
sudo make linux
```

#### RISC-V GNU Go

type:
```
git clone --recursive https://go.googlesource.com/go riscv-go
cd riscv-go/src
./all.bash
cd ../..
sudo mv riscv-go /opt
```

## FRONT-END OPEN SOURCE TOOLS

### MSP430

### OpenRISC

### RISC-V

type:
```
sudo apt install device-tree-compiler libglib2.0-dev libpixman-1-dev pkg-config
```

#### Hardware Engineers Compiler: Spike

**Building Proxy Kernel**

type:
```
export PATH=/opt/riscv-elf-gcc/bin:${PATH}

git clone --recursive https://github.com/riscv/riscv-pk

cd riscv-pk
mkdir build
cd build
../configure --prefix=/opt/riscv-elf-gcc --host=riscv64-unknown-elf
make
sudo make install
```

**Building Spike**

type:
```
export PATH=/opt/riscv-elf-gcc/bin:${PATH}

git clone --recursive https://github.com/riscv/riscv-isa-sim

cd riscv-isa-sim
mkdir build
cd build
../configure --prefix=/opt/riscv-elf-gcc
make
sudo make install
```

#### Software Engineers Compiler: QEMU

type:
```
export PATH=/opt/riscv-elf-gcc/bin:${PATH}

git clone --recursive https://github.com/qemu/qemu

cd qemu
./configure --prefix=/opt/riscv-elf-gcc \
--target-list=riscv64-softmmu,riscv32-softmmu,riscv64-linux-user,riscv32-linux-user
make
sudo make install
```
