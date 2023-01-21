# Gonio

Neovim theme built from [folke/tokyonight](https://github.com/folke/tokyonight.nvim). Includes external themes generated for Kitty, Alacritty, iTerm, Fish and Zsh

## Default

<!-- ![image](https://user-images.githubusercontent.com/292349/115295327-7afdce80-a10e-11eb-89b3-2591262bf95a.png) -->


## ✨ Features

- supports the latest Neovim 5.0 features like TreeSitter and LSP
- minimal inactive statusline
- vim terminal colors
- darker background for sidebar-like windows
- color configs for
  [Kitty](https://sw.kovidgoyal.net/kitty/conf.html?highlight=include),
  [Alacritty](https://github.com/alacritty/alacritty) and
  [Fish Shell](https://fishshell.com/)
  [Zsh](https://github.com/zdharma-continuum/fast-syntax-highlighting)
  [delta](https://github.com/dandavison/delta)
- **lualine** theme

### Plugin Support

- [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [LSP Diagnostics](https://neovim.io/doc/user/lsp.html)
- [LSP Trouble](https://github.com/folke/lsp-trouble.nvim)
- [LSP Saga](https://github.com/glepnir/lspsaga.nvim)
- [Git Signs](https://github.com/lewis6991/gitsigns.nvim)
- [Git Gutter](https://github.com/airblade/vim-gitgutter)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [NvimTree](https://github.com/kyazdani42/nvim-tree.lua)
- [WhichKey](https://github.com/liuchengxu/vim-which-key)
- [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [Dashboard](https://github.com/glepnir/dashboard-nvim)
- [BufferLine](https://github.com/akinsho/nvim-bufferline.lua)
- [Barbecue](https://github.com/utilyre/barbecue.nvim)
- [Lualine](https://github.com/hoob3rt/lualine.nvim)
- [Lightline](https://github.com/itchyny/lightline.vim)
- [Neogit](https://github.com/TimUntersberger/neogit)
- [vim-sneak](https://github.com/justinmk/vim-sneak)
- [Fern](https://github.com/lambdalisue/fern.vim)
- [Barbar](https://github.com/romgrk/barbar.nvim)
- [Scrollbar](https://github.com/petertriho/nvim-scrollbar)
- [Mini](https://github.com/echasnovski/mini.nvim)
- [nvim-ts-rainbow2](https://github.com/HiPhish/nvim-ts-rainbow2)

## ⚡️ Requirements

- Neovim >= 0.6.0

## 📦 Installation

Install the theme with your preferred package manager:

```

[lazy](https://github.com/wbthomason/packer.nvim)

```lua
	{
		"xfo-0/gonio",
		lazy = false,
		priority = 1000,
	},
```

## 🚀 Usage

Enable the colorscheme:

```vim
" Vim Script
colorscheme gonio

" There are also colorschemes for the different styles
colorscheme gonio-night
colorscheme gonio-day
```

```lua
-- Lua
vim.cmd[[colorscheme gonio]]
```

To enable the `gonio` theme for `Barbecue`:

```lua
require('barbecue').setup {
  -- ... your barbecue config
  theme = 'gonio',
  -- ... your barbecue config
}
```

To enable the `gonio` theme for `Lualine`, simply specify it in your lualine
settings:

```lua
require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = 'gonio'
    -- ... your lualine config
  }
}
```

To enable the `gonio` colorscheme for `Lightline`:

```vim
" Vim Script
let g:lightline = {'colorscheme': 'gonio'}
```

## ⚙️ Configuration

> ❗️ configuration needs to be set **BEFORE** loading the color scheme with
> `colorscheme gonio`

The **day** style will be used if:

- `{ style = "day"}` was passed to `setup(options)`
- or `vim.o.background = "light"`

gonio will use the default options, unless you call `setup`.

```lua
require("gonio").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "default", -- The theme comes in one style with option for user configuration 
  light_style = "day", -- The theme is used when the background is set to light
  transparent = false, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  ---@param colors ColorScheme
  on_colors = function(colors) end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights Highlights
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors) end,
})
```

## 🪓 Overriding Colors & Highlight Groups

How the highlight groups are calculated:

1. the **colors** for the style are calculated based on your config
2. `config.on_colors(colors)` is ran, where you can override the colors
3. the **colors** are then used to generate the highlight groups
4. `config.on_highlights(highlights, colors)` is ran, where you can overide the
   highlight groups

Please refer to default values for `colors` and `highlights` for the
[night](extras/lua/gonio_night.lua), [day](extras/lua/gonio_day.lua)

Example for changing some settings and colors

```lua
require("gonio").setup({
  -- use the night style
  style = "night",
  -- disable italic for functions
  styles = {
    functions = {}
  },
  sidebars = { "qf", "vista_kind", "terminal", "packer" },
  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  on_colors = function(colors)
    colors.hint = colors.orange
    colors.error = "#ff0000"
  end
})
```

Example to make Telescope
[borderless](https://github.com/nvim-telescope/telescope.nvim/wiki/Gallery#borderless)

```lua
require("gonio").setup({
  on_highlights = function(hl, c)
    local prompt = "#2d3149"
    hl.TelescopeNormal = {
      bg = c.bg_dark,
      fg = c.fg_dark,
    }
    hl.TelescopeBorder = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
    hl.TelescopePromptNormal = {
      bg = prompt,
    }
    hl.TelescopePromptBorder = {
      bg = prompt,
      fg = prompt,
    }
    hl.TelescopePromptTitle = {
      bg = prompt,
      fg = prompt,
    }
    hl.TelescopePreviewTitle = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
    hl.TelescopeResultsTitle = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
  end,
})
```

### Making `undercurls` work properly in **Tmux**

To have undercurls show up and in color, add the following to your **Tmux**
config file:

```sh
# Undercurl
set -g default-terminal "${TERM}"
set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'  # undercurl support
set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'  # underscore colours - needs tmux-3.0
```

## 🍭 Extras

Extra color configs for **Kitty**, **Alacritty**, **Fish**, **WezTerm**,
**iTerm** and **foot** can be found in [extras](extras/). To use them, refer to
their respective documentation.

<!-- ![image](https://user-images.githubusercontent.com/292349/115395546-d8d6f880-a198-11eb-98fb-a1194787701d.png) -->

You can easily use the color palette for other plugins inside your Neovim
config:

```lua
local colors = require("gonio.colors").setup() -- pass in any of the config options as explained above
local util = require("gonio.util")

aplugin.background = colors.bg_dark
aplugin.my_error = util.brighten(colors.red1, 0.3)
```

## 🔥 Contributing

Pull requests are welcome. For the `extras`, we use a simple template system
that can be used to generate themes for the different styles.

How to add a new extra template:

1. create a file like `lua/gonio/extra/cool-app.lua`
2. add the name and output file extension to the `extras` table in
   `lua/gonio/extra/init.lua`
3. in Nvim, run `:lua require("gonio.extra").setup()` to generate / update extra
   themes
4. commit the newly created themes under `extra/`
