const std = @import("std");

pub fn isIsogram(str: []const u8) bool {
    var gpa: std.heap.GeneralPurposeAllocator(.{}) = .init;
    const allocator = gpa.allocator();
    var map = std.AutoHashMap(u8, bool).init(allocator);
    defer map.deinit();

    for (str) |char| {
        if (char == '-' or char == ' ') {
            continue;
        }

        const lChar = std.ascii.toLower(char);

        if (map.get(lChar) != null) {
            return false;
        }

        map.put(lChar, true) catch undefined;
    }

    return true;
}
