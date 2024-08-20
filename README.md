# **buildroot-2012.02-ARM** #
  
  
**Ready-to-use buildroot for ARM branch - tested on Debian 10/11/12**
  
  
To build the toolchain:

1. Pack the ```/home/[username]/freshtomato-arm/release/src-rt-6.x.4708/linux/linux-2.6.36``` subdirectory (for SDK6) into ```linux-2.6.36.4.tar.bz2``` file and put it in the dl_save folder in buildroot. For other branch (SDK7 or SDK714) use kernel from correct subdirectory.


2. Run:

```sh
./build-toolchain.sh
```
  
New toolchain is available in ```output/host/hndtools-arm-linux-2.6.36-uclibc-4.5.3```.
  
Enjoy!
  
PS: thanks to @st_ty / @st-ty1 for initial idea: https://github.com/st-ty1/Artix_FreshTomato/tree/master/gcc-4.5.3-toolchain_arm
  
