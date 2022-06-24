# **buildroot-2012.02-ARM** #
  
  
**Ready-to-use buildroot for ARM branch - tested only on Debian 10**
  
  
To build the toolchain, just run:

```sh
./build-toolchain.sh
```

Or manually do the following steps

1. Run
    ```sh
    $ make clean
    $ make
    ```
  
2. All the needed packages will be downloaded during the first compilation
  
3. When compilation ends successfuly, cd to ```output/host/hndtools-arm-linux-2.6.36-uclibc-4.5.3``` and add a link:
    ```sh
    $ ln -s arm-linux/sysroot/usr usr
    ```
  
4. Remove:  
    ```hndtools-arm-linux-2.6.36-uclibc-4.5.3/lib/libgmp*```  
    ```hndtools-arm-linux-2.6.36-uclibc-4.5.3/lib/libiberty.a```  
    ```hndtools-arm-linux-2.6.36-uclibc-4.5.3/lib/libc.a```  
  
5. Copy/overwrite newer or changed files from ```dl_save/files```:  
    /fixed:  
     ```in.h``` to ```output/host/hndtools-arm-linux-2.6.36-uclibc-4.5.3/arm-brcm-linux-uclibcgnueabi/sysroot/usr/include/netinet/```  
  
    /namespaces:  
     ```if_link.h``` to ```output/host/hndtools-arm-linux-2.6.36-uclibc-4.5.3/arm-brcm-linux-uclibcgnueabi/sysroot/usr/include/linux/```  
     ```sysnum.h``` to ```output/host/hndtools-arm-linux-2.6.36-uclibc-4.5.3/arm-brcm-linux-uclibcgnueabi/sysroot/usr/include/bits/```  
     ```unistd.h``` to ```output/host/hndtools-arm-linux-2.6.36-uclibc-4.5.3/arm-brcm-linux-uclibcgnueabi/sysroot/usr/include/asm-generic/```  
  
    /newer:  
     ```ctype.h``` to ```output/host/hndtools-arm-linux-2.6.36-uclibc-4.5.3/arm-brcm-linux-uclibcgnueabi/sysroot/usr/include/```  
     ```if_pppol2tp.h``` to ```output/host/hndtools-arm-linux-2.6.36-uclibc-4.5.3/arm-brcm-linux-uclibcgnueabi/sysroot/usr/include/linux/```  
     ```if_pppox.h``` to ```output/host/hndtools-arm-linux-2.6.36-uclibc-4.5.3/arm-brcm-linux-uclibcgnueabi/sysroot/usr/include/linux/```  
     ```timex.h``` to ```output/host/hndtools-arm-linux-2.6.36-uclibc-4.5.3/arm-brcm-linux-uclibcgnueabi/sysroot/usr/include/sys/```  
  
    /pps:  
     ```timepps.h``` to ```output/host/hndtools-arm-linux-2.6.36-uclibc-4.5.3/arm-brcm-linux-uclibcgnueabi/sysroot/usr/include/```  
  
    /wireguard:  
     ```netlink.h``` to ```output/host/hndtools-arm-linux-2.6.36-uclibc-4.5.3/arm-brcm-linux-uclibcgnueabi/sysroot/usr/include/linux/```  
  
Enjoy!
  
PS: thanks to @st_ty / @st-ty1 for initial idea: https://github.com/st-ty1/Artix_FreshTomato/tree/master/arm-uClibc-toolchain_buildroot
  
