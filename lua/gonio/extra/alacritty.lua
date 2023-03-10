local util = require("gonio.util")

local M = {}

--- @param colors ColorScheme
function M.generate(colors)
	local alacrittyColors = {}
	for k, v in pairs(colors) do
		if type(v) == "string" then
			alacrittyColors[k] = v:gsub("^#", "0x")
		end
	end

	local alacritty = util.template(
		[[
# gonio Alacritty Colors
colors:
  # Default colors
  primary:
    background: '${bg}'
    foreground: '${fg}'

  # Normal colors
  normal:
    black:   '${black}'
    red:     '${red}'
    green:   '${tan2}'
    yellow:  '${yellow}'
    blue:    '${brown1}'
    magenta: '${magenta}'
    cyan:    '${orange2}'
    white:   '${fg_dark}'

  # Bright colors
  bright:
    black:   '${terminal_black}'
    red:     '${red}'
    green:   '${tan2}'
    yellow:  '${yellow}'
    blue:    '${brown1}'
    magenta: '${magenta}'
    cyan:    '${orange2}'
    white:   '${fg}'

  indexed_colors:
    - { index: 16, color: '${orange1}' }
    - { index: 17, color: '${red1}' }
  ]],
		alacrittyColors
	)

	return alacritty
end

return M
