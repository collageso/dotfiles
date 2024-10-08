local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 12

config.use_ime = true
config.xim_im_name = "ibus"

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

config.colors = {
	foreground = "#c5c9c5",
	background = "#181616",

	cursor_bg = "#C8C093",
	cursor_fg = "#000000",
	cursor_border = "#C8C093",

	selection_fg = "#C8C093",
	selection_bg = "#2D4F67",

	scrollbar_thumb = "#16161D",
	split = "#16161D",

	ansi = {
		"#0D0C0C",
		"#C4746E",
		"#8A9A7B",
		"#C4B28A",
		"#8BA4B0",
		"#A292A3",
		"#8EA4A2",
		"#C8C093",
	},
	brights = {
		"#A6A69C",
		"#E46876",
		"#87A987",
		"#E6C384",
		"#7FB4CA",
		"#938AA9",
		"#7AA89F",
		"#C5C9C5",
	},
	indexed = { [16] = "#B6927B", [17] = "#B98D7B" },
}

config.window_background_opacity = 0.9

return config
