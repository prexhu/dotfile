local wezterm = require("wezterm")
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
function is_ssh(name)
	return name.find("ssh")
end

local function get_machine_name()
	local foreground_process_name = "?"
	wezterm.on("update-right-status", function(window, pane)
		foreground_process_name = pane:get_foreground_process_name()
		wezterm.log_error(foreground_process_name)
	end)
	if foreground_process_name.find(foreground_process_name, "ssh") then
		return "Remote"
	else
		return "prexhu_MacBookPro"
	end
end

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
		tabline_z = { get_machine_name },
	},
	extensions = {},
})
--tabTheme.merge_tables = function(first_table, second_table, third_table)
--	for k, v in pairs(second_table) do
--		first_table[k] = v
--	end
--	for k, v in pairs(third_table) do
--		first_table[k] = v
--	end
--	return first_table
--end
--
--tabTheme.extract_tab_bar_colors_from_theme = function(theme_name)
--	local wez_theme = wezterm.color.get_builtin_schemes()[theme_name]
--	return {
--		window_frame_colors = {
--			active_titlebar_bg = wez_theme.background,
--			inactive_titlebar_bg = wezterm.color.parse(wez_theme.background):darken(0.8),
--		},
--		tab_bar_colors = {
--			inactive_tab_edge = wezterm.color.parse(wez_theme.background):darken(0.8),
--			active_tab = {
--				bg_color = wez_theme.brights[3],
--				fg_color = wez_theme.background,
--			},
--			inactive_tab = {
--				bg_color = wez_theme.background,
--				fg_color = wez_theme.foreground,
--			},
--			inactive_tab_hover = {
--				bg_color = wezterm.color.parse(wez_theme.background):lighten(0.1),
--				fg_color = wezterm.color.parse(wez_theme.foreground):lighten(0.2),
--			},
--			new_tab = {
--				bg_color = wez_theme.background,
--				fg_color = wez_theme.foreground,
--			},
--			new_tab_hover = {
--				bg_color = wez_theme.brights[3],
--				fg_color = wez_theme.background,
--			},
--		},
--	}
--end
return tabline
