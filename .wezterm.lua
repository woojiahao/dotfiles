local wezterm = require("wezterm")
local action = wezterm.action
local mux = wezterm.mux

local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"

config.font = wezterm.font("SauceCodePro Nerd Font", { weight = "Medium" })
config.font_size = 15
config.background = {
	{
		source = {
			File = "/Users/woojiahao/Pictures/Wallpapers/pexels-josh-hild-1270765-2777932.jpg",
			-- File = "/Users/woojiahao/Pictures/Wallpapers/nyc.jpg",
			-- File = "/Users/woojiahao/Pictures/Wallpapers/1351628.png",
		},
		height = "Cover",
		vertical_align = "Middle",
		hsb = {
			brightness = 0.05,
		},
	},
}
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"

wezterm.on("gui-startup", function(_)
	local _, _, window = mux.spawn_window({})
	local gui_window = window:gui_window()
	gui_window:maximize()
end)

config.native_macos_fullscreen_mode = true

-- Keys inspired by https://gndp.medium.com/mac-native-wezterm-settings-c2a87230908d
config.keys = {
	{ mods = "OPT", key = "LeftArrow", action = action.SendKey({ mods = "ALT", key = "b" }) },
	{ mods = "OPT", key = "RightArrow", action = action.SendKey({ mods = "ALT", key = "f" }) },
	{ mods = "CTRL", key = "-", action = action.DisableDefaultAssignment },
	{ mods = "CTRL", key = "+", action = action.DisableDefaultAssignment },
	{ mods = "OPT", key = "Enter", action = action.DisableDefaultAssignment },
	{ mods = "CMD", key = "t", action = action.DisableDefaultAssignment },
}
config.window_close_confirmation = "NeverPrompt"

config.harfbuzz_features = { "calt=0" }

return config
