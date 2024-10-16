#!/bin/bash

make clean
make

ret=$?
[ $ret -ne 0 ] && {
	echo -e "\nAn error occurred while building the toolchain!\n\n"
} || {
	[ $(cat .config | grep "BR2_GCC_VERSION=\"5.3.0\"") ] && {
		# to build, remove mpc-0.9-configure.patc, buildroot-libtool-v2.4.patch and replace .config, gmp.mk, mpc.mk and mpfr.mk with *.mk-5.3 versions
		TOOLCHAIN=./output/host/hndtools-arm-uclibc-5.3
	} || {
		TOOLCHAIN=./output/host/hndtools-arm-linux-2.6.36-uclibc-4.5.3
	}

	FILES=./dl_save/files
	HERE=$(pwd)
	SYSROOT=$TOOLCHAIN/arm-brcm-linux-uclibcgnueabi/sysroot

	cd $TOOLCHAIN
	ln -sf arm-brcm-linux-uclibcgnueabi arm-linux
	ln -sf arm-linux/sysroot/usr usr
	cd $HERE

	# still needed?
	rm -f $TOOLCHAIN/lib/libgmp.*
	rm -f $TOOLCHAIN/lib/libiberty.a
	rm -f $TOOLCHAIN/lib/libc.a

	cp -f $FILES/fixed/in.h $SYSROOT/usr/include/netinet/in.h
	cp -f $FILES/pps/timepps.h $SYSROOT/usr/include/timepps.h

	echo -e "\nToolchain successfully built!\n\n"
}

exit $ret