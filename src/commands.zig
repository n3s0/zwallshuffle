const std = @import("std");
const build_options = @import("build_options");

const VERSION = build_options.version;

pub fn help() !void {
    const stdout = std.io.getStdOut().writer();

    try stdout.print("Usage: zwallshuffle [OPTION]... [PATH]\n", .{});
    try stdout.print("A command for outputing a random image path to stdout from directory.\n\n", .{});
    try stdout.print("  -h, --help      Display this help message and exit\n", .{});
    try stdout.print("  -v, --version   Show zwallshuffle version and exit\n", .{});
    try stdout.print("  -p, --path      Enter directory path to pick random wallpaper\n", .{});
    try stdout.print("\n", .{});
    
    try stdout.print("Examples:\n", .{});
    try stdout.print("  zwallshuffle -p ~/.config/walls\n", .{});
    try stdout.print("  zwallshuffle --path ~/.config/walls\n", .{});
    try stdout.print("\n", .{});

    try stdout.print("Report a bug: https://github.com/n3s0/zwallshuffle/issues\n", .{});
}

pub fn version() !void {
    const stdout = std.io.getStdOut().writer();

    try stdout.print("zwallshuffle version {s}", .{VERSION});
}
