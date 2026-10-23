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
		tabline_z = { " 󰀵 " },
	},
	extensions = {},
})

return tabline
