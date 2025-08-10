const std = @import("std");

const commands = @import("commands.zig");
const random = @import("random.zig");
const filesystem = @import("filesystem.zig");


pub fn main() !void {
    const stdout = std.io.getStdOut().writer();

    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);

    for (args[1..]) |arg| {
        if (std.mem.eql(u8, arg, "-h") or std.mem.eql(u8, arg, "--help")) {
            try commands.help();
            return;
        } else if (std.mem.eql(u8, arg, "-v") or std.mem.eql(u8, arg, "--version")) {
            try commands.version();
            return;
        } else if (std.mem.eql(u8, arg, "-p") or std.mem.eql(u8, arg, "--path")) {
            const path = args[2];
                        
            try stdout.print("Current path is: {s}\n", .{path});
            
            return;
        } else {
            try commands.help();
            return;
        } 
    }
}
