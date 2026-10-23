local wezterm = require("wezterm")
local keybind = require("keybind")
local tabline = require("tabline")
local config = {
	font_size = 17,
	color_scheme = "Catppuccin Mocha",
	animation_fps = 70,
	font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Bold", stretch = "Normal", style = "Normal" }),
	use_fancy_tab_bar = true,
	hide_tab_bar_if_only_one_tab = false,
	show_new_tab_button_in_tab_bar = false,
	window_background_opacity = 0.7,
	window_decorations = "RESIZE | TITLE | MACOS_FORCE_ENABLE_SHADOW",
	adjust_window_size_when_changing_font_size = false,
	text_background_opacity = 0.7,
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

tabline.apply_to_config(config)
return config
