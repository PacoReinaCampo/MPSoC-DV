export PATH=/opt/or1k-elf-multicore/bin:${PATH}

if [ -n "$BASH_SOURCE" ]; then
   OPTIMSOC="`cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd `"
elif [ -n "$ZSH_NAME" ]; then
   OPTIMSOC="`dirname $0`"
else
   OPTIMSOC="`pwd`"
fi

export OPTIMSOC

export PKG_CONFIG_PATH=$OPTIMSOC/baremetal/baremetal-libs/sw/share/pkgconfig:$PKG_CONFIG_PATH
export PATH=$OPTIMSOC/baremetal/host/bin:$PATH
