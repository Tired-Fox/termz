const std = @import("std");

/// Representation of keyboard input
pub const Key = union(enum) {
    pub const Up: @This() = .{ .up = {} };
    pub const Down: @This() = .{ .down = {} };
    pub const Right: @This() = .{ .right = {} };
    pub const Left: @This() = .{ .left = {} };
    pub const Backspace: @This() = .{ .backspace = {} };
    pub const Esc: @This() = .{ .esc = {} };
    pub const End: @This() = .{ .end = {} };
    pub const Home: @This() = .{ .home = {} };
    pub const Insert: @This() = .{ .insert = {} };
    pub const Delete: @This() = .{ .delete = {} };
    pub const Tab: @This() = .{ .tab = {} };
    pub const Alt: @This() = .{ .alt = {} };
    pub const Enter: @This() = .{ .enter = {} };
    pub const Pageup: @This() = .{ .pageup = {} };
    pub const Pagedown: @This() = .{ .pagedown = {} };
    pub const F0: @This() = .{ .f0 = {} };
    pub const F1: @This() = .{ .f1 = {} };
    pub const F2: @This() = .{ .f2 = {} };
    pub const F3: @This() = .{ .f3 = {} };
    pub const F4: @This() = .{ .f4 = {} };
    pub const F5: @This() = .{ .f5 = {} };
    pub const F6: @This() = .{ .f6 = {} };
    pub const F7: @This() = .{ .f7 = {} };
    pub const F8: @This() = .{ .f8 = {} };
    pub const F9: @This() = .{ .f9 = {} };
    pub const F10: @This() = .{ .f10 = {} };
    pub const F11: @This() = .{ .f11 = {} };
    pub const F12: @This() = .{ .f12 = {} };
    pub const F13: @This() = .{ .f13 = {} };
    pub const F14: @This() = .{ .f14 = {} };
    pub const F15: @This() = .{ .f15 = {} };
    pub const F16: @This() = .{ .f16 = {} };
    pub const F17: @This() = .{ .f17 = {} };
    pub const F18: @This() = .{ .f18 = {} };
    pub const F19: @This() = .{ .f19 = {} };
    pub const F20: @This() = .{ .f20 = {} };
    pub const F21: @This() = .{ .f21 = {} };
    pub const F22: @This() = .{ .f22 = {} };
    pub const F23: @This() = .{ .f23 = {} };
    pub const F24: @This() = .{ .f24 = {} };

    up: void,
    down: void,
    right: void,
    left: void,
    backspace: void,
    esc: void,
    end: void,
    home: void,
    insert: void,
    delete: void,
    tab: void,
    alt: void,
    enter: void,
    pageup: void,
    pagedown: void,
    f0: void,
    f1: void,
    f2: void,
    f3: void,
    f4: void,
    f5: void,
    f6: void,
    f7: void,
    f8: void,
    f9: void,
    f10: void,
    f11: void,
    f12: void,
    f13: void,
    f14: void,
    f15: void,
    f16: void,
    f17: void,
    f18: void,
    f19: void,
    f20: void,
    f21: void,
    f22: void,
    f23: void,
    f24: void,
    char: u21,

    pub fn char(value: u21) @This() {
        return .{ .char = value };
    }

    pub fn eql(current: @This(), other: @This()) bool {
        switch (current) {
            .char => |a| {
                switch (other) {
                    .char => |b| {
                        return a == b;
                    },
                    else => return false,
                }
            },
            else => return @intFromEnum(current) == @intFromEnum(other),
        }
    }
};

/// Keyboard modifiers
pub const Modifiers = packed struct(u3) {
    alt: bool = false,
    ctrl: bool = false,
    shift: bool = false,

    pub fn merge(a: @This(), b: @This()) @This() {
        return .{
            .alt = a.alt or b.alt,
            .ctrl = a.ctrl or b.ctrl,
            .shift = a.shift or b.shift,
        };
    }
};

const Utils = switch (@import("builtin").target.os.tag) {
    .windows => struct {
        extern "kernel32" fn GetNumberOfConsoleInputEvents(
            hConsoleInput: std.os.windows.HANDLE,
            lpcNumberOfEvents: *std.os.windows.DWORD
        ) callconv(.Win64) std.os.windows.BOOL;
    },
    else => struct {}
};

/// Check if the stdin buffer has data to read
///
/// @return true if there is data in the buffer
pub fn pollEvent() bool {
    switch (@import("builtin").target.os.tag) {
        .windows => {
            var count: u32 = 0; 
            const stdin = std.os.windows.GetStdHandle(std.os.windows.STD_INPUT_HANDLE) catch { return false; };
            const result = Utils.GetNumberOfConsoleInputEvents(stdin, &count);
            return result != 0 and count > 0;
        },
        else => {
            var buffer: [1]std.os.linux.pollfd = [_]std.os.linux.pollfd{std.os.linux.pollfd{
                .fd = std.os.linux.STDIN_FILENO,
                .events = std.os.linux.POLL.IN,
                .revents = 0,
            }};
            return std.os.linux.poll(&buffer, 1, 1) > 0;
        },
    }
}

/// Read a line from the terminal
///
/// @return error if out of memory or failed to read from the terminal
pub fn readUntil(allocator: std.mem.Allocator, delim: u21, max_size: usize) !?[]u8 {
    return try std.io.getStdin().reader().readUntilDelimiterOrEofAlloc(allocator, delim, max_size);
}

/// Read a line from the terminal
///
/// @return error if out of memory or failed to read from the terminal
pub fn readLine(allocator: std.mem.Allocator, max_size: usize) !?[]u8 {
    return readUntil(allocator, '\n', max_size);
}

/// Keyboard event
pub const KeyEvent = struct {
    key: Key,
    modifiers: Modifiers = .{}
};

/// Supported mouse button events
pub const MouseButton = enum {
    Left,
    Middle,
    Right,
    ScrollRight,
    ScrollLeft,
    XButton1,
    XButton2,
    Other
};
pub const ButtonState = enum(u2) { Pressed, Released };
pub const ScrollDirection = enum(u2) { Up, Down };

pub const MouseButtonEvent = struct {
    type: MouseButton,
    state: ButtonState,
};

pub const MouseEventType = union(enum) {
    move: void,
    button: MouseButtonEvent,
    scroll: ScrollDirection,
};

pub const MouseEvent = struct {
    col: u16,
    row: u16,

    type: MouseEventType,
};

pub const Event = union(enum) {
    key_event: KeyEvent,
    mouse_event: MouseEvent,
    /// Requires `Capture.EnableFocus` to be executed
    focus_event: bool,
    /// Requires `Capture.EnableBracketedPaste` to be executed
    paste_event: []const u8
};

// ABCD F H M PQRS Z m ~
// 65 66 67 68  70  72  77  80 81 82 83  90  109  126
fn isSequenceEnd(char: u8) bool {
    return ('A' <= char and char <= 'D')
        or char == 'F'
        or ('H' <= char and char <= 'I')
        or ('M' <= char and char <= 'O')
        or ('P' <= char and char <= 'S')
        or char == 'Z'
        or char == 'm'
        or char == '~';
}

/// Parse the next input event.
///
/// The User is responsible for freeing memory allocated from a paste event
///
/// **WARNING**: This function blocks until the next input event.
///
/// **WARNING**: Most of the data is stack allocated, except for the `paste_event`.
/// This event occurs when the `BracketedPaste` feature is enabled and contains a variable
/// length allocated string which is the content pasted into the terminal.
///
/// # Example
///
/// ```zig
/// var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
/// defer arena.deinit();
/// const allocator = arena.allocator();
///
/// if (try events.parseEvent(alloc)) |event| {
///     switch (event) {
///         .paste_event => |content| allocator.free(content),
///         else => {}
///     }
/// }
/// ```
pub fn parseEvent(allocator: std.mem.Allocator) !?Event {
    switch (builtin.os.tag) {
        .windows => {

        }
    }
}
 // fn try_read(&mut self, timeout: Option<Duration>) -> std::io::Result<Option<InternalEvent>> {
 //        let poll_timeout = PollTimeout::new(timeout);
 //
 //        loop {
 //            if let Some(event_ready) = self.poll.poll(poll_timeout.leftover())? {
 //                let number = self.console.number_of_console_input_events()?;
 //                if event_ready && number != 0 {
 //                    let event = match self.console.read_single_input_event()? {
 //                        InputRecord::KeyEvent(record) => {
 //                            handle_key_event(record, &mut self.surrogate_buffer)
 //                        }
 //                        InputRecord::MouseEvent(record) => {
 //                            let mouse_event =
 //                                handle_mouse_event(record, &self.mouse_buttons_pressed);
 //                            self.mouse_buttons_pressed = MouseButtonsPressed {
 //                                left: record.button_state.left_button(),
 //                                right: record.button_state.right_button(),
 //                                middle: record.button_state.middle_button(),
 //                            };
 //
 //                            mouse_event
 //                        }
 //                        InputRecord::WindowBufferSizeEvent(record) => {
 //                            // windows starts counting at 0, unix at 1, add one to replicate unix behaviour.
 //                            Some(Event::Resize(
 //                                (record.size.x as i32 + 1) as u16,
 //                                (record.size.y as i32 + 1) as u16,
 //                            ))
 //                        }
 //                        InputRecord::FocusEvent(record) => {
 //                            let event = if record.set_focus {
 //                                Event::FocusGained
 //                            } else {
 //                                Event::FocusLost
 //                            };
 //                            Some(event)
 //                        }
 //                        _ => None,
 //                    };
 //
 //                    if let Some(event) = event {
 //                        return Ok(Some(InternalEvent::Event(event)));
 //                    }
 //                }
 //            }
 //
 //            if poll_timeout.elapsed() {
 //                return Ok(None);
 //            }
 //        }
 //    }

test "event::pollEvent" {
    try std.testing.expect(!pollEvent());
}

test "event::Key::eql" {
    try std.testing.expect(Key.Esc.eql(Key.Esc));
    try std.testing.expect(Key.char('d').eql(Key.char('d')));
    try std.testing.expect(!Key.char('d').eql(Key.Esc));
}

test "event::Key::char" {
    try std.testing.expectEqual(Key.char('d'), Key { .char = 'd' });
}
