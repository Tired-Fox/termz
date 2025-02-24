const std = @import("std");

/// XTerm named colors
pub const XTerm = enum(u8) {
    Black = 0,
    Maroon = 1,
    Green = 2,
    Olive = 3,
    Navy = 4,
    Purple = 129,
    Teal = 6,
    Silver = 7,
    Grey = 8,
    Red = 9,
    Lime = 10,
    Yellow = 11,
    Blue = 12,
    Fuchsia = 13,
    Aqua = 14,
    White = 15,
    NavyBlue = 17,
    DarkBlue = 18,
    Blue3 = 20,
    DarkGreen = 22,
    DeepSkyBlue4 = 25,
    DodgerBlue3 = 26,
    DodgerBlue2 = 27,
    Green4 = 28,
    SpringGreen4 = 29,
    Turquoise4 = 30,
    DeepSkyBlue3 = 32,
    DodgerBlue1 = 33,
    Green3 = 40,
    SpringGreen3 = 41,
    DarkCyan = 36,
    LightSeaGreen = 37,
    DeepSkyBlue2 = 38,
    DeepSkyBlue1 = 39,
    SpringGreen2 = 47,
    Cyan3 = 43,
    DarkTurquoise = 44,
    Turquoise2 = 45,
    SpringGreen1 = 48,
    MediumSpringGreen = 49,
    Cyan2 = 50,
    DarkRed = 88,
    DeepPink4 = 125,
    Purple4 = 55,
    Purple3 = 56,
    BlueViolet = 57,
    Orange4 = 94,
    Grey37 = 59,
    MediumPurple4 = 60,
    SlateBlue3 = 62,
    RoyalBlue1 = 63,
    Chartreuse4 = 64,
    DarkSeaGreen4 = 71,
    PaleTurquoise4 = 66,
    SteelBlue = 67,
    SteelBlue3 = 68,
    CornflowerBlue = 69,
    Chartreuse3 = 76,
    CadetBlue = 73,
    SkyBlue3 = 74,
    SteelBlue1 = 81,
    PaleGreen3 = 114,
    SeaGreen3 = 78,
    Aquamarine3 = 79,
    MediumTurquoise = 80,
    Chartreuse2 = 112,
    SeaGreen2 = 83,
    SeaGreen1 = 85,
    Aquamarine1 = 122,
    DarkSlateGray2 = 87,
    DarkMagenta = 91,
    DarkViolet = 128,
    LightPink4 = 95,
    Plum4 = 96,
    MediumPurple3 = 98,
    SlateBlue1 = 99,
    Yellow4 = 106,
    Wheat4 = 101,
    Grey53 = 102,
    LightSlateGrey = 103,
    MediumPurple = 104,
    LightSlateBlue = 105,
    DarkOliveGreen3 = 149,
    DarkSeaGreen = 108,
    LightSkyBlue3 = 110,
    SkyBlue2 = 111,
    DarkSeaGreen3 = 150,
    DarkSlateGray3 = 116,
    SkyBlue1 = 117,
    Chartreuse1 = 118,
    LightGreen = 120,
    PaleGreen1 = 156,
    DarkSlateGray1 = 123,
    Red3 = 160,
    MediumVioletRed = 126,
    Magenta3 = 164,
    DarkOrange3 = 166,
    IndianRed = 167,
    HotPink3 = 168,
    MediumOrchid3 = 133,
    MediumOrchid = 134,
    MediumPurple2 = 140,
    DarkGoldenrod = 136,
    LightSalmon3 = 173,
    RosyBrown = 138,
    Grey63 = 139,
    MediumPurple1 = 141,
    Gold3 = 178,
    DarkKhaki = 143,
    NavajoWhite3 = 144,
    Grey69 = 145,
    LightSteelBlue3 = 146,
    LightSteelBlue = 147,
    Yellow3 = 184,
    DarkSeaGreen2 = 157,
    LightCyan3 = 152,
    LightSkyBlue1 = 153,
    GreenYellow = 154,
    DarkOliveGreen2 = 155,
    DarkSeaGreen1 = 193,
    PaleTurquoise1 = 159,
    DeepPink3 = 162,
    Magenta2 = 200,
    HotPink2 = 169,
    Orchid = 170,
    MediumOrchid1 = 207,
    Orange3 = 172,
    LightPink3 = 174,
    Pink3 = 175,
    Plum3 = 176,
    Violet = 177,
    LightGoldenrod3 = 179,
    Tan = 180,
    MistyRose3 = 181,
    Thistle3 = 182,
    Plum2 = 183,
    Khaki3 = 185,
    LightGoldenrod2 = 222,
    LightYellow3 = 187,
    Grey84 = 188,
    LightSteelBlue1 = 189,
    Yellow2 = 190,
    DarkOliveGreen1 = 192,
    Honeydew2 = 194,
    LightCyan1 = 195,
    DeepPink2 = 197,
    DeepPink1 = 199,
    OrangeRed1 = 202,
    IndianRed1 = 204,
    HotPink = 206,
    DarkOrange = 208,
    Salmon1 = 209,
    LightCoral = 210,
    PaleVioletRed1 = 211,
    Orchid2 = 212,
    Orchid1 = 213,
    Orange1 = 214,
    SandyBrown = 215,
    LightSalmon1 = 216,
    LightPink1 = 217,
    Pink1 = 218,
    Plum1 = 219,
    Gold1 = 220,
    NavajoWhite1 = 223,
    MistyRose1 = 224,
    Thistle1 = 225,
    LightGoldenrod1 = 227,
    Khaki1 = 228,
    Wheat1 = 229,
    Cornsilk1 = 230,
    Grey3 = 232,
    Grey7 = 233,
    Grey11 = 234,
    Grey15 = 235,
    Grey19 = 236,
    Grey23 = 237,
    Grey27 = 238,
    Grey30 = 239,
    Grey35 = 240,
    Grey39 = 241,
    Grey42 = 242,
    Grey46 = 243,
    Grey54 = 245,
    Grey58 = 246,
    Grey62 = 247,
    Grey66 = 248,
    Grey70 = 249,
    Grey74 = 250,
    Grey78 = 251,
    Grey82 = 252,
    Grey85 = 253,
    Grey89 = 254,
    Grey93 = 255,
};

/// Ansi Color Representation
pub const Color = union(enum) {
    pub const Black: @This() = .{ .black = {} };
    pub const Red: @This() = .{ .red = {} };
    pub const Green: @This() = .{ .green = {} };
    pub const Yellow: @This() = .{ .yellow = {} };
    pub const Blue: @This() = .{ .blue = {} };
    pub const Magenta: @This() = .{ .magenta = {} };
    pub const Cyan: @This() = .{ .cyan = {} };
    pub const White: @This() = .{ .white = {} };
    pub const Default: @This() = .{ .default = {} };

    /// System `black`
    black: void,
    /// System `red`
    red: void,
    /// System `green`
    green: void,
    /// System `yellow`
    yellow: void,
    /// System `blue`
    blue: void,
    /// System `magenta`
    magenta: void,
    /// System `cyan`
    cyan: void,
    /// System `white`
    white: void,
    default: void,

    rgb: std.meta.Tuple(&.{ u8, u8, u8 }),
    xterm: XTerm,

    pub fn rgb(r: u8, g: u8, b: u8) @This() {
        return .{ .rgb = .{ r, g, b } };
    }

    pub fn xterm(xt: XTerm) @This() {
        return .{ .xterm = xt };
    }

    pub fn format(self: @This(), comptime _: []const u8, _: std.fmt.FormatOptions, writer: anytype) !void {
        switch (self) {
            .black => try writer.print("0", .{}),
            .red => try writer.print("1", .{}),
            .green => try writer.print("2", .{}),
            .yellow => try writer.print("3", .{}),
            .blue => try writer.print("4", .{}),
            .magenta => try writer.print("5", .{}),
            .cyan => try writer.print("6", .{}),
            .white => try writer.print("7", .{}),
            .default => try writer.print("9", .{}),
            .rgb => |_rgb| {
                try writer.print("8;2;{d};{d};{d}", .{ _rgb[0], _rgb[1], _rgb[2] });
            },
            .xterm => |_xterm| {
                try writer.print("8;5;{d}", .{@intFromEnum(_xterm)});
            },
        }
    }
};

/// Styling for ansi text
pub const Style = struct {
    bold: bool = false,
    underline: bool = false,
    italic: bool = false,
    blink: bool = false,
    /// Strikethrough
    crossed: bool = false,
    /// Swap foreground and background colors
    reverse: bool = false,

    fg: ?Color = null,
    bg: ?Color = null,

    pub fn new() @This() {
        return .{};
    }

    pub fn bold() @This() {
        return .{ .bold = true };
    }

    /// Strikethrough
    pub fn crossed() @This() {
        return .{ .crossed = true };
    }

    pub fn italic() @This() {
        return .{ .italic = true };
    }

    pub fn underline() @This() {
        return .{ .underline = true };
    }

    pub fn blink() @This() {
        return .{ .blink = true };
    }

    /// Swap foreground and background colors
    pub fn reverse() @This() {
        return .{ .reverse = true };
    }

    pub fn fg(color: Color) @This() {
        return .{ .fg = color };
    }

    pub fn bg(color: Color) @This() {
        return .{ .bg = color };
    }

    /// Generate the representation that will reset the styling
    pub fn reset(self: @This()) Reset {
        return .{
            .bold = self.bold,
            .italic = self.italic,
            .underline = self.underline,
            .blink = self.blink,
            .crossed = self.crossed,
            .reverse = self.reverse,
            .fg = self.fg != null,
            .bg = self.bg != null,
        };
    }

    pub fn format(self: @This(), comptime _: []const u8, _: std.fmt.FormatOptions, writer: anytype) !void {
        if (self.bold or self.italic or self.underline or self.blink or self.reverse or self.fg != null or self.bg != null) {
            var at_least_one = false;
            try writer.print("\x1b[", .{});

            if (self.bold) {
                try writer.print("{s}1", .{if (at_least_one) ";" else ""});
                at_least_one = true;
            }

            if (self.italic) {
                try writer.print("{s}3", .{if (at_least_one) ";" else ""});
                at_least_one = true;
            }

            if (self.crossed) {
                try writer.print("{s}9", .{if (at_least_one) ";" else ""});
                at_least_one = true;
            }

            if (self.underline) {
                try writer.print("{s}4", .{if (at_least_one) ";" else ""});
                at_least_one = true;
            }

            if (self.blink) {
                try writer.print("{s}5", .{if (at_least_one) ";" else ""});
                at_least_one = true;
            }

            if (self.reverse) {
                try writer.print("{s}7", .{if (at_least_one) ";" else ""});
                at_least_one = true;
            }

            if (self.fg) |_fg| {
                try writer.print("{s}3{s}", .{ if (at_least_one) ";" else "", _fg });
                at_least_one = true;
            }

            if (self.bg) |_bg| {
                try writer.print("{s}4{s}", .{ if (at_least_one) ";" else "", _bg });
                at_least_one = true;
            }
            try writer.print("m", .{});
        }
    }
};

/// Representation of sequences to reset ansi styling
pub const Reset = struct {
    bold: bool = false,
    underline: bool = false,
    italic: bool = false,
    blink: bool = false,
    crossed: bool = false,
    reverse: bool = false,
    fg: bool = false,
    bg: bool = false,

    pub fn new() @This() {
        return .{};
    }

    pub fn bold() @This() {
        return .{ .bold = true };
    }

    pub fn crossed() @This() {
        return .{ .crossed = true };
    }

    pub fn italic() @This() {
        return .{ .italic = true };
    }

    pub fn underline() @This() {
        return .{ .underline = true };
    }

    pub fn blink() @This() {
        return .{ .blink = true };
    }

    pub fn reverse() @This() {
        return .{ .reverse = true };
    }

    pub fn fg() @This() {
        return .{ .fg = true };
    }

    pub fn bg() @This() {
        return .{ .bg = true };
    }

    pub fn format(self: @This(), comptime _: []const u8, _: std.fmt.FormatOptions, writer: anytype) !void {
        if (self.bold or self.italic or self.underline or self.blink or self.reverse or self.fg or self.bg) {
            var at_least_one = false;
            try writer.print("\x1b[", .{});

            if (self.bold) {
                try writer.print("{s}22", .{if (at_least_one) ";" else ""});
                at_least_one = true;
            }

            if (self.italic) {
                try writer.print("{s}23", .{if (at_least_one) ";" else ""});
                at_least_one = true;
            }

            if (self.crossed) {
                try writer.print("{s}29", .{if (at_least_one) ";" else ""});
                at_least_one = true;
            }

            if (self.underline) {
                try writer.print("{s}24", .{if (at_least_one) ";" else ""});
                at_least_one = true;
            }

            if (self.blink) {
                try writer.print("{s}25", .{if (at_least_one) ";" else ""});
                at_least_one = true;
            }

            if (self.reverse) {
                try writer.print("{s}27", .{if (at_least_one) ";" else ""});
                at_least_one = true;
            }

            if (self.fg) {
                try writer.print("{s}39", .{ if (at_least_one) ";" else "" });
                at_least_one = true;
            }

            if (self.bg) {
                try writer.print("{s}49", .{ if (at_least_one) ";" else "" });
                at_least_one = true;
            }
            try writer.print("m", .{});
        }
    }
};

test "style::Color::format" {
    var format = try std.fmt.allocPrint(std.testing.allocator, "{}", .{ Color.Black });
    try std.testing.expect(std.mem.eql(u8, format, "0"));
    std.testing.allocator.free(format);

    format = try std.fmt.allocPrint(std.testing.allocator, "{}", .{ Color.rgb(255, 10, 180) });
    try std.testing.expect(std.mem.eql(u8, format, "8;2;255;10;180"));
    std.testing.allocator.free(format);

    format = try std.fmt.allocPrint(std.testing.allocator, "{}", .{ Color.xterm(.Aqua) });
    try std.testing.expect(std.mem.eql(u8, format, "8;5;14"));
    std.testing.allocator.free(format);
}

test "style::Style::format" {
    var format = try std.fmt.allocPrint(std.testing.allocator, "{}", .{ Style {} });
    try std.testing.expect(std.mem.eql(u8, format, ""));
    std.testing.allocator.free(format);

    format = try std.fmt.allocPrint(std.testing.allocator, "{}", .{ Style {
        .bold = true,
        .italic = true,
        .crossed = true,
        .underline = true,
        .blink = true,
        .reverse = true,
        .fg = Color.Red,
        .bg = Color.Blue,
    } });
    try std.testing.expect(std.mem.eql(u8, format, "\x1b[1;3;9;4;5;7;31;44m"));
    std.testing.allocator.free(format);
}

test "style::Reset::format" {
    var format = try std.fmt.allocPrint(std.testing.allocator, "{}", .{ Reset {} });
    try std.testing.expect(std.mem.eql(u8, format, ""));
    std.testing.allocator.free(format);

    format = try std.fmt.allocPrint(std.testing.allocator, "{}", .{ Reset {
        .bold = true,
        .italic = true,
        .crossed = true,
        .underline = true,
        .blink = true,
        .reverse = true,
        .fg = true,
        .bg = true,
    } });
    try std.testing.expect(std.mem.eql(u8, format, "\x1b[22;23;29;24;25;27;39;49m"));
    std.testing.allocator.free(format);
}
