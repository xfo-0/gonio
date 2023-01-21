local M = {}

-- TODO:
--       add file for zsh plugin fast-syntax-highlighting
--
local function write(str, fileName)
	print("[write] extra/" .. fileName)
	vim.fn.mkdir(vim.fs.dirname("extras/" .. fileName), "p")
	local file = io.open("extras/" .. fileName, "w")
	file:write(str)
	file:close()
end

function M.setup()
	local config = require("gonio.config")
	vim.o.background = "dark"

	-- map of plugin name to plugin extension
	local extras = {
		kitty = "conf",
		alacritty = "yml",
		tmux = "tmux",
		lua = "lua",
		delta = "gitconfig",
	}
	-- map of style to style name
	local styles = {  night = "", day = " Day" }

	for extra, ext in pairs(extras) do
		local plugin = require("gonio.extra." .. extra)
		for style, style_name in pairs(styles) do
			config.setup({ style = style })
			local colors = require("gonio.colors").setup({ transform = true })
			local fname = extra .. "/gonio_" .. style .. "." .. ext
			colors["_upstream_url"] = "https://github.com/xfo-0/gonio.nvim/raw/main/extras/" .. fname
			colors["_style_name"] = "gonio " .. style_name
			write(plugin.generate(colors), fname)
		end
	end
end

return M
