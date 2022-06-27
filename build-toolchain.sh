#!/bin/bash

set -e
set -x

make clean
make

FILES=./dl_save/files
TOOLCHAIN=./output/host/hndtools-arm-linux-2.6.36-uclibc-4.5.3
SYSROOT=$TOOLCHAIN/arm-brcm-linux-uclibcgnueabi/sysroot

ln -s arm-linux/sysroot/usr $TOOLCHAIN/usr

rm $TOOLCHAIN/lib/libgmp.*
rm $TOOLCHAIN/lib/libiberty.a
rm $TOOLCHAIN/lib/libc.a

cp $FILES/fixed/in.h $SYSROOT/usr/include/netinet/in.h
cp $FILES/namespaces/if_link.h $SYSROOT/usr/include/linux/if_link.h
cp $FILES/namespaces/sysnum.h $SYSROOT/usr/include/bits/sysnum.h
cp $FILES/namespaces/unistd.h $SYSROOT/usr/include/asm-generic/unistd.h

cp $FILES/newer/ctype.h $SYSROOT/usr/include/ctype.h
cp $FILES/newer/if_pppol2tp.h $SYSROOT/usr/include/linux/if_pppol2tp.h
cp $FILES/newer/if_pppox.h $SYSROOT/usr/include/linux/if_pppox.h
cp $FILES/newer/timex.h $SYSROOT/usr/include/sys/timex.h

cp $FILES/pps/timepps.h $SYSROOT/usr/include/timepps.h

cp $FILES/wireguard/netlink.h $SYSROOT/usr/include/linux/netlink.h

echo "Toolchain successfully built!"
