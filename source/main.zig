//#include <3ds.h>
//#include <stdio.h>
const c = @cImport({ 
    @cInclude("3ds.h");
    @cInclude("stdio.h");
     });

const std = @import("std");

pub export fn main(arg_argc: c_int, arg_argv: [*c][*c]u8) c_int {
    var argc = arg_argc;
    _ = argc;
    var argv = arg_argv;
    _ = argv;
    const keysNames: [32][]const u8 = [_][]const u8{ 
        "KEY_A",
        "KEY_B",
        "KEY_SELECT",
        "KEY_START",
        "KEY_DRIGHT",
        "KEY_DLEFT",
        "KEY_DUP",
        "KEY_DDOWN",
        "KEY_R",
        "KEY_L",
        "KEY_X",
        "KEY_Y",
        "",
        "",
        "KEY_ZL",
        "KEY_ZR",
        "",
        "",
        "",
        "",
        "KEY_TOUCH",
        "",
        "",
        "",
        "KEY_CSTICK_RIGHT",
        "KEY_CSTICK_LEFT",
        "KEY_CSTICK_UP",
        "KEY_CSTICK_DOWN",
        "KEY_CPAD_RIGHT",
        "KEY_CPAD_LEFT",
        "KEY_CPAD_UP",
        "KEY_CPAD_DOWN", };
    
    c.gfxInitDefault();
    _ = c.consoleInit(@bitCast(c_uint, c.GFX_TOP), null);
    var kDownOld: u32 = 0;
    var kHeldOld: u32 = 0;
    var kUpOld: u32 = 0;
    _ = c.printf("\x1b[1;1HPress Start to exit.");
    _ = c.printf("\x1b[2;1HCirclePad position:");
    while (c.aptMainLoop()) {
        c.hidScanInput();
        var kDown: u32 = c.hidKeysDown();
        var kHeld: u32 = c.hidKeysHeld();
        var kUp: u32 = c.hidKeysUp();
        if ((kDown & @bitCast(c_uint, c.KEY_START)) != 0) break;
        if (((kDown != kDownOld) or (kHeld != kHeldOld)) or (kUp != kUpOld)) {
            c.consoleClear();
            _ = c.printf("\x1b[1;1HPress Start to exit.");
            _ = c.printf("\x1b[2;1HCirclePad position:");
            _ = c.printf("\x1b[4;1H");
            var i: u32 = 0;
            {
                while (i < 32) : (i += 1) {
                    //error: LHS of shift must be a fixed-width integer type, or RHS must be compile-time known
                    
                    var isDown = (kDown & @shlExact(@intCast(u32, kDown), @intCast(u5, i)));
                    if (isDown != 0) {//@intToPtr([*c]u8, @ptrToInt("foo"))
                        _ = c.printf("%s down\n", @intToPtr([*c]u8, @ptrToInt(&keysNames[i])));
                    }
                    var isHeld = (kHeld & @shlExact(@intCast(u32, kDown), @intCast(u5, i)));
                    if (isHeld != 0) {
                        _ = c.printf("%s held\n", @intToPtr([*c]u8, @ptrToInt(&keysNames[i])));
                    }

                    var isUp = (kUp & @shlExact(@intCast(u32, kDown), @intCast(u5, i)));
                    if (isUp != 0) {
                        _ = c.printf("%s up\n", @intToPtr([*c]u8, @ptrToInt(&keysNames[i])));
                    }
                }
            }
        }
        kDownOld = kDown;
        kHeldOld = kHeld;
        kUpOld = kUp;
        var pos: c.circlePosition = undefined;
        c.hidCircleRead(&pos);
        _ = c.printf("\x1b[3;1H%04d; %04d", @bitCast(c_int, @as(c_int, pos.dx)), @bitCast(c_int, @as(c_int, pos.dy)));
        c.gfxFlushBuffers();
        c.gfxSwapBuffers();
        c.gspWaitForEvent(@bitCast(c_uint, c.GSPGPU_EVENT_VBlank0), @as(c_int, 1) != 0);
    }
    c.gfxExit();
    return 0;
}
