const std = @import("std");

const commands = @import("commands.zig");
const random = @import("random.zig");
const filesystem = @import("filesystem.zig");


pub fn main() !void {
    var args = std.process.args();
    while (args.next()) |arg_slice| {
        const arg = std.mem.sliceToOwnedCstr(arg_slice, std.heap.page_allocator);
        defer arg.deinit(); // Free allocated memory

        std.debug.print("Argument: {s}\n", .{arg.ptr});
        // Implement parsing logic here (e.g., check for flags, options)
    }
    
}
