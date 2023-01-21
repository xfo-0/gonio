local util = require("gonio.util")

local M = {}

---@class Palette
M.default = {
	none = "NONE",
	bg_dark = "#000000",
	bg = "#000000",
	bg_highlight = "#121212",
	bg_visual = "#403933",
	terminal_black = "#000000",
	white = "#ffffff",
	fg = "#d9d9d9",
	fg_dark = "#b9b9b9",
	fg_gutter = "#828282",
	fg_sidebar = "#121212",
	-- fg_visual = "#110801",
	dark3 = "#1c1c1c",
	grey0 = "#3e3a3a",
	grey1 = "#2e2e2e",
	grey2 = "#9e9e9e",
	grey3 = "#6e6e6e",
	comment = "#747070",
	magenta = "#5c5053",
	-- green = "#7c605b",
	brown = "#7d5a32",
	brown1 = "#af875f",
	orange = "#bf7c13",
	orange1 = "#d78700",
	orange2 = "#d7875f",
	yellow = "#e0af68",
	tan = "#dfaf87",
	tan1 = "#cbb190",
	tan2 = "#bfb0a2",
	red = "#af5f5f",
	red1 = "#d75f5f",
	-- blue = "#005d7c",
	brown2 = "#7c605b",
	green = "#777d69",
	green1 = "#687263",
	purple = "#6e626f",
	git = { change = "#6183bb", add = "#449dab", delete = "#914c54" },
	gitSigns = { add = "#266d6a", change = "#536c9e", delete = "#b2555b" },
}

M.night = { bg = "#1a1b26", bg_dark = "#16161e" }
M.day = M.night

---@return ColorScheme
function M.setup(opts)
	opts = opts or {}
	local config = require("gonio.config")

	local style = config.is_day() and config.options.light_style or config.options.style
	local palette = M[style] or {}
	if type(palette) == "function" then
		palette = palette()
	end

	-- Color Palette
	---@class ColorScheme: Palette
	local colors = vim.tbl_deep_extend("force", M.default, palette)

	util.bg = colors.bg
	util.day_brightness = config.options.day_brightness

	colors.diff = {
		add = util.darken(colors.green1, 0.15),
		delete = util.darken(colors.red1, 0.15),
		change = util.darken(colors.brown2, 0.15),
		text = colors.brown2,
	}

	colors.git.ignore = colors.dark3
	colors.black = util.darken(colors.bg, 0.8, "#000000")
	colors.border_highlight = util.darken(colors.orange, 0.8)
	colors.border = colors.black

	-- Popups and statusline always get a dark background
	colors.bg_popup = colors.bg_dark
	colors.bg_statusline = colors.bg_dark

	-- Sidebar and Floats are configurable
	colors.bg_sidebar = config.options.styles.sidebars == "transparent" and colors.none
		or config.options.styles.sidebars == "dark" and colors.bg_dark
		or colors.bg

	colors.bg_float = config.options.styles.floats == "transparent" and colors.none
		or config.options.styles.floats == "dark" and colors.bg_dark
		or colors.bg

	colors.bg_visual = util.darken(colors.grey0, 0.7)
	colors.bg_search = colors.grey0
	colors.fg_sidebar = colors.fg_dark
	-- colors.fg_float = config.options.styles.floats == "dark" and colors.fg_dark or colors.fg
	colors.fg_float = colors.fg

	colors.error = colors.red1
	colors.warning = colors.yellow
	colors.info = colors.tan
	colors.hint = colors.tan1

	config.options.on_colors(colors)
	if opts.transform and config.is_day() then
		util.invert_colors(colors)
	end

	return colors
end

return M
