local wezterm = require("wezterm")
local config = {}

-- APPEARANCE
config.color_scheme = "GruvboxDark"
config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 9
config.window_background_opacity = 0.9
config.initial_cols = 180
config.initial_rows = 60

-- EXIT BEHAVIOR
config.window_close_confirmation = "NeverPrompt"

-- HIDE TAB BAR
config.hide_tab_bar_if_only_one_tab = true

-- RUN FISH SHELL
config.default_prog = { "/usr/bin/fish", "-l" }

return config
