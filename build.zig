
const std = @import("std");
const CrossTarget = std.zig.CrossTarget;
const Builder = @import("std").build.Builder;
const builtin = @import("builtin");

const threeds_arm_target = blk: {
    var target = CrossTarget{
        .cpu_arch = std.Target.Cpu.Arch.arm,
        .cpu_model = .{ .explicit = &std.Target.arm.cpu.mpcore},
        .os_tag = .freestanding,
        .abi = .eabihf
    };
    //target.cpu_features_add.addFeature(@enumToInt(std.Target.arm.Feature.thumb_mode));
    break :blk target;
};

pub fn build(b: *Builder) void {
    const mode = b.standardReleaseOptions();

    const exe = b.addExecutable("zig.elf", "source/main.zig");
    exe.setTarget(threeds_arm_target);

    exe.addLibPath("/opt/devkitpro/libctru/lib/");
    exe.addLibPath("/opt/devkitpro/devkitARM/arm-none-eabi/lib/");
    exe.addIncludePath("/opt/devkitpro/libctru/include");
    exe.linkSystemLibrary("ctru");
    exe.linkSystemLibrary("m");
    exe.verbose_link = true;
    exe.bundle_compiler_rt = false;
    exe.link_function_sections = true;
    exe.omit_frame_pointer = true;
    //exe.libc_file = @import("std").build.FileSource{.path = "libc.config"};
    exe.addSystemIncludeDir("/opt/devkitpro/devkitARM/arm-none-eabi/include");
    exe.single_threaded = true;
    exe.link_emit_relocs = true;
    //mword-relocations

    exe.setBuildMode(mode);
    exe.setLinkerScriptPath(@import("std").build.FileSource{.path = "/opt/devkitpro/devkitARM/arm-none-eabi/lib/3dsx.ld"});
    exe.setOutputDir(".");

    b.default_step.dependOn(&exe.step);
    //b.installArtifact(exe);
}