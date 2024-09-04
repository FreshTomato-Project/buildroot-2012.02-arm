#!/bin/bash

make clean
make

ret=$?
[ $ret -ne 0 ] && {
	echo -e "\nAn error occurred while building the toolchain!\n\n"
} || {
	FILES=./dl_save/files
	HERE=$(pwd)
	TOOLCHAIN=./output/host/hndtools-arm-uclibc-5.3
	SYSROOT=$TOOLCHAIN/arm-brcm-linux-uclibcgnueabi/sysroot

	cd $TOOLCHAIN
	ln -sf arm-brcm-linux-uclibcgnueabi arm-linux
	ln -sf arm-linux/sysroot/usr usr
	cd $HERE

	rm -f $TOOLCHAIN/lib/libgmp.*
	rm -f $TOOLCHAIN/lib/libiberty.a
	rm -f $TOOLCHAIN/lib/libc.a

	cp -f $FILES/fixed/in.h $SYSROOT/usr/include/netinet/in.h
	#cp -f $FILES/namespaces/if_link.h $SYSROOT/usr/include/linux/if_link.h
	#cp -f $FILES/namespaces/sysnum.h $SYSROOT/usr/include/bits/sysnum.h
	#cp -f $FILES/namespaces/unistd.h $SYSROOT/usr/include/asm-generic/unistd.h
	#cp -f $FILES/newer/ctype.h $SYSROOT/usr/include/ctype.h
	cp -f $FILES/newer/if_pppol2tp.h $SYSROOT/usr/include/linux/if_pppol2tp.h
	cp -f $FILES/newer/if_pppox.h $SYSROOT/usr/include/linux/if_pppox.h
	cp -f $FILES/newer/timex.h $SYSROOT/usr/include/sys/timex.h
	cp -f $FILES/pps/timepps.h $SYSROOT/usr/include/timepps.h
	cp -f $FILES/wireguard/netlink.h $SYSROOT/usr/include/linux/netlink.h

	echo -e "\nToolchain successfully built!\n\n"
}

exit $ret
