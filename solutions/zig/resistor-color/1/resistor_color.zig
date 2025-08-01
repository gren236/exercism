const std = @import("std");
pub const ColorBand = enum {
    black,
    brown,
    red,
    orange,
    yellow,
    green,
    blue,
    violet,
    grey,
    white,
};

pub fn colorCode(color: ColorBand) usize {
    return @intFromEnum(color);
}

pub fn colors() []const ColorBand {
    const enumLen = @typeInfo(ColorBand).@"enum".fields.len;
    var bands: [enumLen]ColorBand = undefined;
    inline for (0..enumLen) |i| {
        bands[i] = @enumFromInt(i);
    }

    return bands[0..];
}
