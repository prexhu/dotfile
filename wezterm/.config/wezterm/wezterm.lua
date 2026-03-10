local wezterm = require("wezterm")
local keybind = require("keybind")
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
--local tabTheme = require("tabTheme")
--local tab_bar_theme = tabTheme.extract_tab_bar_colors_from_theme("Catppuccin Mocha")
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
	--window_frame = tabTheme.merge_tables({
	--	font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Bold", stretch = "Normal", style = "Normal" }),
	--}, tab_bar_theme.window_frame_colors, { font_size = 10 }),

	--colors = {
	--	tab_bar = tab_bar_theme.tab_bar_colors,
	--},

	adjust_window_size_when_changing_font_size = false,
	text_background_opacity = 1,
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
	tabline.setup({
		options = {
			icons_enabled = true,
			theme = "Catppuccin Mocha",
			tabs_enabled = true,
			theme_overrides = {},
			section_separators = {
				left = wezterm.nerdfonts.pl_left_hard_divider,
				right = wezterm.nerdfonts.pl_right_hard_divider,
			},
			component_separators = {
				left = wezterm.nerdfonts.pl_left_soft_divider,
				right = wezterm.nerdfonts.pl_right_soft_divider,
			},
			tab_separators = {
				left = wezterm.nerdfonts.pl_left_hard_divider,
				right = wezterm.nerdfonts.pl_right_hard_divider,
			},
		},
		sections = {
			tabline_a = { "mode" },
			tabline_b = { "workspace" },
			tabline_c = { " " },
			tab_active = {
				"index",
				{ "parent", padding = 0 },
				"/",
				{ "cwd", padding = { left = 0, right = 1 } },
				{ "zoomed", padding = 0 },
			},
			tab_inactive = { "index", { "process", padding = { left = 0, right = 1 } } },
			tabline_x = { "ram", "cpu" },
			tabline_y = { "datetime", "battery" },
			tabline_z = { "hostname" },
		},
		extensions = {},
	}),
}
tabline.apply_to_config(config)
return config
