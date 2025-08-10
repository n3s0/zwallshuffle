const std = @import("std");

pub fn build(b: *std.Build) void {
    
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "zwallshuffle",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    const options = b.addOptions();

    const opt_version_string = b.option([]const u8, "version-string", "Override version string");
    const v = if (opt_version_string) |version| version else "0.0.0";
    options.addOption([]const u8, "version", v);
    
    exe.root_module.addOptions("build_options", options);

    b.installArtifact(exe);

    //const exe_unit_tests = b.addTest(.{
    //    .root_source_file = b.path("src/calculator_test.zig"),
    //    .target = target,
    //    .optimize = optimize,
    //});

    //const run_exe_unit_tests = b.addRunArtifact(exe_unit_tests);
    //const test_step = b.step("test", "Run unit tests");
    //test_step.dependOn(&run_exe_unit_tests.step);
}
