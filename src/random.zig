const std = @import("std");

fn getRandomNumber(max: i32) !i32 {
    var rn: i32 = undefined;
    
    var prng = std.Random.DefaultPrng.init(blk: {
        var seed: u64 = undefined;
        try std.posix.getrandom(std.mem.asBytes(&seed));
        break :blk seed;
    });

    rn = prng.random().intRangeAtMost(i32, 0, max);
    
    return rn;
}
