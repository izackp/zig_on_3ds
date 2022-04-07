# zig_on_3ds

All compiling/notes/paths are based on having these things installed on a Macos (arm64):
* https://devkitpro.org/wiki/Getting_Started
* zig

[steps.md](steps.md) contains verbose output of the makefile provided from devkitpro when compiling, linking, and building a 3ds binary

Currently some parts that I _feel_ are missing:
* 3dsx.specs should be passed to the linker

Currently stuck on:
```sh
zig build --verbose-link --verbose --color on --prominent-compile-errors

/opt/homebrew/Cellar/zig/HEAD-7b7f45d/bin/zig build-exe --color on /Users/isaacpaul/Projects/3ds/read-controls/source/main.zig -lctru -lc --verbose-link --emit-relocs -ffunction-sections --libc /Users/isaacpaul/Projects/3ds/read-controls/libc.config --cache-dir /Users/isaacpaul/Projects/3ds/read-controls/zig-cache --global-cache-dir /Users/isaacpaul/.cache/zig --name zig.elf -fno-compiler-rt -fsingle-threaded -fomit-frame-pointer -target arm-freestanding-eabihf -mcpu mpcore --script /opt/devkitpro/devkitARM/arm-none-eabi/lib/3dsx.ld -I /opt/devkitpro/libctru/include -isystem /opt/devkitpro/devkitARM/arm-none-eabi/include -L /opt/devkitpro/libctru/lib/ -L /opt/devkitpro/devkitARM/arm-none-eabi/lib/ --enable-cache

ld.lld -error-limit=0 -O0 -z stack-size=16777216 -T /opt/devkitpro/devkitARM/arm-none-eabi/lib/3dsx.ld --gc-sections --emit-relocs -m armelf_linux_eabi -Bstatic -o /Users/isaacpaul/Projects/3ds/read-controls/zig-cache/o/4c8e8c86add7a8c5e478e994fd3d6685/zig.elf -L /opt/devkitpro/libctru/lib/ -L /opt/devkitpro/devkitARM/arm-none-eabi/lib/ -L /opt/devkitpro/devkitARM/arm-none-eabi/lib /opt/devkitpro/libctru/lib//libctru.a /Users/isaacpaul/Projects/3ds/read-controls/zig-cache/o/4c8e8c86add7a8c5e478e994fd3d6685/zig.elf.o --as-needed --start-group -lm -lpthread -lc -ldl -lrt -lutil --end-group --allow-shlib-undefined

ld.lld: error: unable to find library -lpthread
ld.lld: error: unable to find library -ldl
ld.lld: error: unable to find library -lrt
ld.lld: error: unable to find library -lutil
error: LLDReportedFailure
zig.elf...The step exited with error code 1
```

Possible ways to move forward:
* Look through zig git history and see how some platforms are added.
* Don't provide a 'libc' to zig and manually link libraries in [steps.md](steps.md).
* Investigate libc file for zig.. maybe there are settings that I'm missing.

Notes:
- zig build-obj will build a mach-o binary instead of an elf32-littlearm