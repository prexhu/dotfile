local wezterm = require("wezterm")
local keybind = {}
function is_nvim(name)
	return name:find("nvim")
end

keybind.leader = { key = "Space", mods = "SHIFT" }
keybind.keys = {
	{
		key = "l",
		mods = "LEADER",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "h",
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "k",
		mods = "CTRL",
		action = wezterm.action_callback(function(win, pane)
			local proc_name = pane:get_foreground_process_name()
			if is_nvim(proc_name) then
				win:perform_action(wezterm.action.SendKey({ key = "k", mods = "CTRL" }), pane)
			else
				win:perform_action(wezterm.action.ActivatePaneDirection("Up"), pane)
			end
		end),
	},
	{
		key = "j",
		mods = "CTRL",
		action = wezterm.action_callback(function(win, pane)
			local proc_name = pane:get_foreground_process_name()
			if is_nvim(proc_name) then
				win:perform_action(wezterm.action.SendKey({ key = "j", mods = "CTRL" }), pane)
			else
				win:perform_action(wezterm.action.ActivatePaneDirection("Down"), pane)
			end
		end),
	},

	{
		key = "h",
		mods = "CTRL",
		action = wezterm.action_callback(function(win, pane)
			local proc_name = pane:get_foreground_process_name()
			if is_nvim(proc_name) then
				win:perform_action(wezterm.action.SendKey({ key = "h", mods = "CTRL" }), pane)
			else
				win:perform_action(wezterm.action.ActivatePaneDirection("Left"), pane)
			end
		end),
	},

	{
		key = "l",
		mods = "CTRL",
		action = wezterm.action_callback(function(win, pane)
			local proc_name = pane:get_foreground_process_name()
			if is_nvim(proc_name) then
				win:perform_action(wezterm.action.SendKey({ key = "l", mods = "CTRL" }), pane)
			else
				win:perform_action(wezterm.action.ActivatePaneDirection("Right"), pane)
			end
		end),
	},
	{
		key = "d",
		mods = "CTRL",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "Tab",
		mods = "CTRL",
		action = wezterm.action.ActivatePaneDirection("Next"),
	},
	{
		key = "t",
		mods = "LEADER",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "i",
		mods = "CTRL",
		action = wezterm.action_callback(function(win, pane)
			local proc_name = pane:get_foreground_process_name()
			wezterm.log_error("Hello from callback!")
			wezterm.log_error(proc_name)
		end),
	},
}
return keybind
