local colors = require("gonio.colors").setup({ transform = true })
local config = require("gonio.config").options

local gonio = {}

gonio.normal = {
	a = { bg = colors.bg_highlight, fg = colors.black },
	b = { bg = colors.fg_visual, fg = colors.magenta },
	c = { bg = colors.bg_statusline, fg = colors.fg_dark },
}

gonio.insert = {
	a = { bg = colors.bg_highlight, fg = colors.black },
	b = { bg = colors.bg_highlight, fg = colors.fg },
}

gonio.command = {
	a = { bg = colors.bg_highlight, fg = colors.black },
	b = { bg = colors.bg_highlight, fg = colors.brown1 },
}

gonio.visual = {
	a = { bg = colors.bg_highlight, fg = colors.comment },
	b = { bg = colors.bg_highlight, fg = colors.orange },
}

gonio.replace = {
	a = { bg = colors.black, fg = colors.red },
	b = { bg = colors.black, fg = colors.red },
}

gonio.terminal = {
	a = { bg = colors.bg_highlight, fg = colors.black },
	b = { bg = colors.orange2, fg = colors.black },
}

gonio.inactive = {
	a = { bg = colors.black, fg = colors.grey0 },
	b = { bg = colors.black, fg = colors.grey0, gui = "bold" },
	c = { bg = colors.black, fg = colors.grey0 },
}

if config.lualine_bold then
	for _, mode in pairs(gonio) do
		mode.a.gui = "bold"
	end
end

return gonio
