local wezterm = require("wezterm")
local tabTheme = {}
tabTheme.merge_tables = function(first_table, second_table, third_table)
	for k, v in pairs(second_table) do
		first_table[k] = v
	end
	for k, v in pairs(third_table) do
		first_table[k] = v
	end
	return first_table
end

tabTheme.extract_tab_bar_colors_from_theme = function(theme_name)
	local wez_theme = wezterm.color.get_builtin_schemes()[theme_name]
	return {
		window_frame_colors = {
			active_titlebar_bg = wez_theme.background,
			inactive_titlebar_bg = wezterm.color.parse(wez_theme.background):darken(0.8),
		},
		tab_bar_colors = {
			inactive_tab_edge = wezterm.color.parse(wez_theme.background):darken(0.8),
			active_tab = {
				bg_color = wez_theme.brights[3],
				fg_color = wez_theme.background,
			},
			inactive_tab = {
				bg_color = wez_theme.background,
				fg_color = wez_theme.foreground,
			},
			inactive_tab_hover = {
				bg_color = wezterm.color.parse(wez_theme.background):lighten(0.1),
				fg_color = wezterm.color.parse(wez_theme.foreground):lighten(0.2),
			},
			new_tab = {
				bg_color = wez_theme.background,
				fg_color = wez_theme.foreground,
			},
			new_tab_hover = {
				bg_color = wez_theme.brights[3],
				fg_color = wez_theme.background,
			},
		},
	}
end
return tabTheme
