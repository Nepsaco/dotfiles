-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'Tokyo Night'
config.color_scheme = "Catppuccin Mocha"
config.enable_tab_bar = false

config.font = wezterm.font_with_fallback({
	"DejaVuSansM Nerd Font Mono",
	"Jetbrains Mono",
})
config.font_size = 14.0

config.keys = {
	{ key = "C", mods = "CMD", action = wezterm.action.CopyTo("ClipboardAndPrimarySelection") },
	{ key = "V", mods = "CMD", action = wezterm.action.PasteFrom("Clipboard") },
	{ key = "V", mods = "CMD", action = wezterm.action.PasteFrom("PrimarySelection") },
}

config.mouse_bindings = {
	-- CMD-click will open the link under the mouse cursor
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "SHIFT",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CMD",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}
-- and finally, return the configuration to wezterm
return config
