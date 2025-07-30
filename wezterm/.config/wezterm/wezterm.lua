local wezterm = require("wezterm")
local keybind = require("keybind")
local tabTheme = require("tabTheme")
local tab_bar_theme = tabTheme.extract_tab_bar_colors_from_theme("Catppuccin Mocha")
local config = {
	font_size = 12,
	color_scheme = "Catppuccin Mocha",
	animation_fps = 70,
	font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Bold", stretch = "Normal", style = "Normal" }),
	use_fancy_tab_bar = true,
	hide_tab_bar_if_only_one_tab = false,
	show_new_tab_button_in_tab_bar = false,
	window_background_opacity = 0.7,
	window_decorations = "RESIZE",
	window_frame = tabTheme.merge_tables({
		font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Bold", stretch = "Normal", style = "Normal" }),
	}, tab_bar_theme.window_frame_colors, { font_size = 10 }),

	colors = {
		tab_bar = tab_bar_theme.tab_bar_colors,
	},

	adjust_window_size_when_changing_font_size = false,
	text_background_opacity = 0.3,
	default_cursor_style = "BlinkingUnderline",
	leader = keybind.leader,
	keys = keybind.keys,
	debug_key_events = true,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
}

return config
