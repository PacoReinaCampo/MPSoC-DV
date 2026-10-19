# INSTRUCTIONS TESTS

type:

```bash
git clone --recursive https://github.com/openrisc/or1k-tests

cd or1k-tests/native
make clean
make
```

type:

```bash
sudo apt install -y bison
sudo apt install -y build-essential
sudo apt install -y flex
sudo apt install -y git
sudo apt install -y libgmp-dev
sudo apt install -y libmpc-dev
sudo apt install -y libmpfr-dev
sudo apt install -y texinfo
sudo apt install -y zlib1g-dev
```

type:

```bash
git clone https://github.com/openrisc/binutils-gdb.git binutils-gdb
git clone https://github.com/openrisc/or1k-gcc.git gcc
git clone https://github.com/openrisc/newlib.git newlib

export PATH=/opt/or1k-elf-gcc/bin:${PATH}

mkdir build-binutils; cd build-binutils
../binutils-gdb/configure --target=or1k-elf --prefix=/opt/or1k-elf-gcc \
--disable-itcl --disable-tk --disable-tcl --disable-winsup --disable-gdbtk \
--disable-libgui --disable-rda --disable-sid --disable-sim --disable-gdb \
--with-sysroot --disable-newlib --disable-libgloss --with-system-zlib
make
sudo make install
cd ..

mkdir build-gcc-stage1; cd build-gcc-stage1
../gcc/configure --target=or1k-elf --prefix=/opt/or1k-elf-gcc \
--enable-languages=c --disable-shared --disable-libssp
make
sudo make install
cd ..

mkdir build-newlib; cd build-newlib
../newlib/configure --target=or1k-elf --prefix=/opt/or1k-elf-gcc
make
sudo make install
cd ..

mkdir build-gcc-stage2; cd build-gcc-stage2
../gcc/configure --target=or1k-elf --prefix=/opt/or1k-elf-gcc \
--enable-languages=c,c++ --disable-shared --disable-libssp --with-newlib
make
sudo make install
cd ..

mkdir build-gdb; cd build-gdb
../binutils-gdb/configure --target=or1k-elf --prefix=/opt/or1k-elf-gcc --disable-itcl \
--disable-tk --disable-tcl --disable-winsup --disable-gdbtk --disable-libgui \
--disable-rda --disable-sid --with-sysroot --disable-newlib --disable-libgloss \
--disable-gas --disable-ld --disable-binutils --disable-gprof --with-system-zlib
make
sudo make install
cd ..
```

| **Tool**   | **Address**                                |
|------------|--------------------------------------------|
| `binutils` | `https://github.com/openrisc/binutils-gdb` |
| `dejagnu`  | `https://github.com/openrisc/or1k-dejagnu` |
| `gcc`      | `https://github.com/openrisc/or1k-gcc`     |
| `gdb`      | `https://github.com/openrisc/binutils-gdb` |
| `glibc`    | `https://github.com/openrisc/or1k-glibc`   |
| `llvm`     | `https://github.com/openrisc/llvm-or1k`    |
| `musl`     | `https://github.com/openrisc/musl-cross`   |
| `newlib`   | `https://github.com/openrisc/newlib`       |
| `uclibc`   | `https://github.com/openrisc/uClibc-or1k`  |

:GNU ToolChain

Here is the list of configure option for specify source tree:

    --with-binutils-src
    --with-dejagnu-src
    --with-gcc-src
    --with-gdb-src
    --with-glibc-src
    --with-llvm-src
    --with-musl-src
    --with-newlib-src
    --with-uclibc-src
