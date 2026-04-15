const std = @import("std");
pub const panic = std.debug.no_panic;

// pub fn main(init: std.process.Init) !void {
//     _ = init;
//     std.log.info("Hello there !", .{});
// }

export fn add(a: u32, b: u32) u32 {
    return a + b + 1;
}
