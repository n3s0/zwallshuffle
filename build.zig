const std = @import("std");

pub fn build(b: *std.Build) void {
    
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const zigcli_dep = b.dependency("cli", .{ .target = target });
    const zigcli_mod = zigcli_dep.module("cli");

    const exe = b.addExecutable(.{
        .name = "zwallshuffle",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    exe.root_module.addImport("cli", zigcli_mod);

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
