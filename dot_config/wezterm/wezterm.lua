local wezterm = require("wezterm")

local config
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
    config = require("windows")
elseif wezterm.target_triple == "aarch64-apple-darwin" then
    config = require("macos")
else
    config = {}
end

-- Window
config.window_decorations = "RESIZE"

-- Tab bar
config.use_fancy_tab_bar = false
config.window_frame = {
    font_size = 11.0,
}

-- Quick-select
config.quick_select_patterns = {
    --  "(?<=password           )\\S+",
    --  "(?<=username           )\\S+"
}

-- Theme
config.color_scheme = "tokyonight_storm"

-- Scrollback
config.scrollback_lines = 10000

-- smart-splits.nvim setup
local ss = require("smart-splits")
local function append_table(src_tbl, dst_tbl)
    table.move(src_tbl, 1, #src_tbl, #dst_tbl + 1, dst_tbl)
    return dst_tbl
end
append_table(ss.keys, config.keys)

return config
