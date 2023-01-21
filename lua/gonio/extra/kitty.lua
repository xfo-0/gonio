local util = require("gonio.util")

local M = {}

--- @param colors ColorScheme
function M.generate(colors)
	local kitty = util.template(
		[[
# vim:ft=kitty

## name: ${_style_name}
## license: MIT
## author: Folke Lemaitre
## upstream: ${_upstream_url}


background ${bg}
foreground ${fg}
selection_background ${bg_visual}
selection_foreground ${fg}
url_color ${green2}
cursor ${fg}
cursor_text_color ${bg}

# Tabs
active_tab_background ${brown1}
active_tab_foreground ${bg_dark}
inactive_tab_background ${bg_highlight}
inactive_tab_foreground ${dark3}
#tab_bar_background ${black}

# Windows
active_border_color ${brown1}
inactive_border_color ${bg_highlight}

# normal
color0 ${black}
color1 ${red}
color2 ${green}
color3 ${yellow}
color4 ${brown1}
color5 ${magenta}
color6 ${orange2}
color7 ${fg_dark}

# bright
color8 ${terminal_black}
color9 ${red}
color10 ${green}
color11 ${yellow}
color12 ${brown1}
color13 ${magenta}
color14 ${orange2}
color15 ${fg}

# extended colors
color16 ${orange1}
color17 ${red1}
]],
		colors
	)
	return kitty
end

return M
