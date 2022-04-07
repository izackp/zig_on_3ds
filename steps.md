```
mkdir -p build
/Applications/Xcode.app/Contents/Developer/usr/bin/make --no-print-directory -C build -f /Users/isaacpaul/Projects/3ds/read-controls/Makefile
main.c
arm-none-eabi-gcc -MMD -MP -MF /Users/isaacpaul/Projects/3ds/read-controls/build/main.d -g -Wall -O2 -mword-relocations -fomit-frame-pointer -ffunction-sections -march=armv6k -mtune=mpcore -mfloat-abi=hard -mtp=soft -I/Users/isaacpaul/Projects/3ds/read-controls/include -I/opt/devkitpro/libctru/include -I/Users/isaacpaul/Projects/3ds/read-controls/build -DARM11 -D_3DS -c /Users/isaacpaul/Projects/3ds/read-controls/source/main.c -o main.o 
linking read-controls.elf
arm-none-eabi-gcc -specs=3dsx.specs -g -march=armv6k -mtune=mpcore -mfloat-abi=hard -mtp=soft -Wl,-Map,read-controls.map      main.o  -L/opt/devkitpro/libctru/lib -lctru -lm -o /Users/isaacpaul/Projects/3ds/read-controls/read-controls.elf
arm-none-eabi-gcc-nm -CSn /Users/isaacpaul/Projects/3ds/read-controls/read-controls.elf > read-controls.lst
smdhtool --create "read-controls" "Built with devkitARM & libctru" "Unspecified Author" /opt/devkitpro/libctru/default_icon.png /Users/isaacpaul/Projects/3ds/read-controls/read-controls.smdh
built ... read-controls.smdh
3dsxtool /Users/isaacpaul/Projects/3ds/read-controls/read-controls.elf /Users/isaacpaul/Projects/3ds/read-controls/read-controls.3dsx --smdh=/Users/isaacpaul/Projects/3ds/read-controls/read-controls.smdh
built ... read-controls.3dsx
```

verbose linker:
```
/opt/devkitpro/devkitARM/bin/arm-none-eabi-gcc --verbose -specs=3dsx.specs -g -march=armv6k -mtune=mpcore -mfloat-abi=hard -mtp=soft -Wl,-Map,read-controls.map      /Users/isaacpaul/Projects/3ds/read-controls/build/main.o   -L/opt/devkitpro/libctru/lib -lctru -lm -o /Users/isaacpaul/Projects/3ds/read-controls/read-controls.elf

Using built-in specs.
Reading specs from /opt/devkitpro/devkitARM/arm-none-eabi/lib/3dsx.specs
rename spec link to old_link
COLLECT_GCC=/opt/devkitpro/devkitARM/bin/arm-none-eabi-gcc
COLLECT_LTO_WRAPPER=/opt/devkitpro/devkitARM/libexec/gcc/arm-none-eabi/11.1.0/lto-wrapper
Target: arm-none-eabi

Configured with: ../../gcc-11.1.0/configure --enable-languages=c,c++,objc,lto --with-gnu-as --with-gnu-ld --with-gcc --with-march=armv4t --enable-cxx-flags=-ffunction-sections --disable-libstdcxx-verbose --enable-poison-system-directories --enable-interwork --enable-multilib --enable-threads --disable-win32-registry --disable-nls --disable-debug --disable-libmudflap --disable-libssp --disable-libgomp --disable-libstdcxx-pch --enable-libstdcxx-time=yes --enable-libstdcxx-filesystem-ts --target=arm-none-eabi --with-newlib --with-headers=../../newlib-4.1.0/newlib/libc/include --prefix=/home/davem/projects/devkitpro/tool-packages/devkitARM/src/build/x86_64-apple-darwin20.2/devkitARM --enable-lto --disable-tm-clone-registry --disable-__cxa_atexit --with-bugurl=http:/wiki.devkitpro.org/index.php/Bug_Reports --with-pkgversion='devkitARM release 56' --build=x86_64-unknown-linux-gnu --host=x86_64-apple-darwin20.2 --with-gmp=/opt/devkitpro/crosstools/x86_64-apple-darwin20.2 --with-mpfr=/opt/devkitpro/crosstools/x86_64-apple-darwin20.2 --with-mpc=/opt/devkitpro/crosstools/x86_64-apple-darwin20.2 --with-isl=/opt/devkitpro/crosstools/x86_64-apple-darwin20.2 --with-zstd=/opt/devkitpro/crosstools/x86_64-apple-darwin20.2

Thread model: single
Supported LTO compression algorithms: zlib zstd
gcc version 11.1.0 (devkitARM release 56) 

COMPILER_PATH=/opt/devkitpro/devkitARM/libexec/gcc/arm-none-eabi/11.1.0/:/opt/devkitpro/devkitARM/libexec/gcc/:/opt/devkitpro/devkitARM/arm-none-eabi/bin/

LIBRARY_PATH=/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/11.1.0/armv6k/fpu/:/opt/devkitpro/devkitARM/arm-none-eabi/lib/armv6k/fpu/:/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/11.1.0/:/opt/devkitpro/devkitARM/lib/gcc/:/opt/devkitpro/devkitARM/arm-none-eabi/lib/

COLLECT_GCC_OPTIONS='-v' '-specs=3dsx.specs' '-g'  '-mtune=mpcore' '-mfloat-abi=hard' '-mtp=soft' '-L/opt/devkitpro/libctru/lib' '-o' '/Users/isaacpaul/Projects/3ds/read-controls/read-controls.elf' '-marm' '-march=armv6k' '-dumpdir' '/Users/isaacpaul/Projects/3ds/read-controls/read-controls.elf.'

 /opt/devkitpro/devkitARM/libexec/gcc/arm-none-eabi/11.1.0/collect2 
 -plugin /opt/devkitpro/devkitARM/libexec/gcc/arm-none-eabi/11.1.0/liblto_plugin.so 
 -plugin-opt=/opt/devkitpro/devkitARM/libexec/gcc/arm-none-eabi/11.1.0/lto-wrapper 
 -plugin-opt=-fresolution=/var/folders/b2/g7qp54yx2jbcbknb336nyjwm0000gn/T/ccnzIv1h.res 
 -plugin-opt=-pass-through=-lgcc 
 -plugin-opt=-pass-through=-lg 
 -plugin-opt=-pass-through=-lc 
 -plugin-opt=-pass-through=-lsysbase 
 -X 
 -T /opt/devkitpro/devkitARM/arm-none-eabi/lib/3dsx.ld 
 -d 
 --emit-relocs 
 --use-blx 
 --gc-sections 
 -o /Users/isaacpaul/Projects/3ds/read-controls/read-controls.elf 
 /opt/devkitpro/devkitARM/arm-none-eabi/lib/armv6k/fpu/3dsx_crt0.o 
 /opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/11.1.0/armv6k/fpu/crti.o
 /opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/11.1.0/armv6k/fpu/crtbegin.o 
 -L/opt/devkitpro/libctru/lib 
 -L/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/11.1.0/armv6k/fpu 
 -L/opt/devkitpro/devkitARM/arm-none-eabi/lib/armv6k/fpu 
 -L/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/11.1.0 
 -L/opt/devkitpro/devkitARM/lib/gcc 
 -L/opt/devkitpro/devkitARM/arm-none-eabi/lib 
 -Map read-controls.map 
 /Users/isaacpaul/Projects/3ds/read-controls/build/main.o 
 -lctru -lm --start-group -lgcc -lg -lc -lsysbase --end-group
  /opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/11.1.0/armv6k/fpu/crtend.o 
  /opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/11.1.0/armv6k/fpu/crtn.o

COLLECT_GCC_OPTIONS='-v' '-specs=3dsx.specs' '-g'  '-mtune=mpcore' '-mfloat-abi=hard' '-mtp=soft' '-L/opt/devkitpro/libctru/lib' '-o' '/Users/isaacpaul/Projects/3ds/read-controls/read-controls.elf' '-marm' '-march=armv6k' '-dumpdir' '/Users/isaacpaul/Projects/3ds/read-controls/read-controls.elf.'

```