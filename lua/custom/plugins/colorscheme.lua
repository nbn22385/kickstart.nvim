return {
	{
		"ellisonleao/gruvbox.nvim",
		opts = {
			-- gruvbox options
			terminal_colors = true, -- add neovim terminal colors
			undercurl = true,
			underline = true,
			bold = true,
			italic = {
				strings = true,
				emphasis = true,
				comments = true,
				operators = false,
				folds = true,
			},
			strikethrough = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			invert_intend_guides = false,
			inverse = true, -- invert background for search, diffs, statuslines and errors
			contrast = "", -- can be "hard", "soft" or empty string
			palette_overrides = {},
			overrides = {},
			dim_inactive = false,
			transparent_mode = false,
		},
		config = function()
			-- vim.cmd.colorscheme 'gruvbox'
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		opts = {
			-- kanagawa options
			compile = false,             -- enable compiling the colorscheme
			undercurl = true,            -- enable undercurls
			commentStyle = { italic = true },
			functionStyle = {},
			keywordStyle = { italic = true},
			statementStyle = { bold = true },
			typeStyle = {},
			transparent = false,         -- do not set background color
			dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
			terminalColors = true,       -- define vim.g.terminal_color_{0,17}
			colors = {                   -- add/modify theme and palette colors
				palette = {},
				theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
			},
			overrides = function(colors) -- add/modify highlights
				return {}
			end,
			theme = "wave",              -- Load "wave" theme when 'background' option is not set
			background = {               -- map the value of 'background' option to a theme
				dark = "wave",           -- try "dragon" !
				light = "lotus"
			},
		},
		config = function()
			-- vim.cmd.colorscheme 'kanagawa'
		end,
	},
	{
		'marko-cerovac/material.nvim',
		opts = {
			-- material options
			contrast = {
				terminal = false, -- Enable contrast for the built-in terminal
				sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
				floating_windows = false, -- Enable contrast for floating windows
				cursor_line = false, -- Enable darker background for the cursor line
				non_current_windows = false, -- Enable contrasted background for non-current windows
				filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
			},

			styles = { -- Give comments style such as bold, italic, underline etc.
				comments = { --[[ italic = true ]] },
				strings = { --[[ bold = true ]] },
				keywords = { --[[ underline = true ]] },
				functions = { --[[ bold = true, undercurl = true ]] },
				variables = {},
				operators = {},
				types = {},
			},

			plugins = { -- Uncomment the plugins that you use to highlight them
				-- Available plugins:
				-- "dap",
				-- "dashboard",
				-- "eyeliner",
				-- "fidget"
				-- "flash"
				"gitsigns",
				-- "harpoon",
				-- "hop",
				-- "illuminate",
				"indent-blankline",
				-- "lspsaga",
				-- "mini",
				-- "neogit",
				-- "neotest",
				-- "neorg",
				-- "noice"
				"nvim-cmp",
				-- "nvim-navic",
				"nvim-tree",
				"nvim-web-devicons",
				-- "rainbow-delimiters",
				-- "sneak",
				"telescope",
				-- "trouble",
				-- "which-key",
			},

			disable = {
				colored_cursor = false, -- Disable the colored cursor
				borders = false, -- Disable borders between verticaly split windows
				background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
				term_colors = false, -- Prevent the theme from setting terminal colors
				eob_lines = false -- Hide the end-of-buffer lines
			},

			high_visibility = {
				lighter = false, -- Enable higher contrast text for lighter style
				darker = false -- Enable higher contrast text for darker style
			},

			lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )

			async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)

			custom_colors = nil, -- If you want to override the default colors, set this to a function

			custom_highlights = {}, -- Overwrite highlights with your own
		},
		config = function()
			-- styles: darker, lighter, oceanic, palenight, deep ocean
			vim.g.material_style = "deep ocean"
			-- vim.cmd.colorscheme 'material'
		end,
	},
	{
		'navarasu/onedark.nvim',
		opts = {
			-- onedark options
			style = 'dark', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
			transparent = false,  -- Show/hide background
			term_colors = true, -- Change terminal color as per the selected theme style
			ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
			cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

			-- toggle theme style ---
			toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
			toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between

			-- Change code style ---
			-- Options are italic, bold, underline, none
			-- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
			code_style = {
				comments = 'italic',
				keywords = 'none',
				functions = 'none',
				strings = 'none',
				variables = 'none'
			},

			-- Lualine options --
			lualine = {
				transparent = false, -- lualine center bar transparency
			},

			-- Custom Highlights --
			colors = {}, -- Override default colors
			highlights = {}, -- Override highlight groups

			-- Plugins Config --
			diagnostics = {
				darker = true, -- darker colors for diagnostic
				undercurl = true,   -- use undercurl instead of underline for diagnostics
				background = true,    -- use background color for virtual text
			},
		},
		config = function()
			-- vim.cmd.colorscheme 'onedark'
		end,
	},
	{
		'rmehri01/onenord.nvim',
		opts = {
			theme = nil, -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
			borders = true, -- Split window borders
			fade_nc = false, -- Fade non-current windows, making them more distinguishable
			-- Style that is applied to various groups: see `highlight-args` for options
			styles = {
				comments = "NONE",
				strings = "NONE",
				keywords = "NONE",
				functions = "NONE",
				variables = "NONE",
				diagnostics = "underline",
			},
			disable = {
				background = false, -- Disable setting the background color
				float_background = false, -- Disable setting the background color for floating windows
				cursorline = false, -- Disable the cursorline
				eob_lines = true, -- Hide the end-of-buffer lines
			},
			-- Inverse highlight for different groups
			inverse = {
				match_paren = false,
			},
			custom_highlights = {}, -- Overwrite default highlight groups
			custom_colors = {}, -- Overwrite default colors
		},
		config = function()
			-- vim.cmd.colorscheme 'onenord'
		end
	},
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		opts = {
			-- catppuccin options
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			background = { -- :h background
				light = "latte",
				dark = "mocha",
			},
			transparent_background = false, -- disables setting the background color.
			show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
			term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
			dim_inactive = {
				enabled = false, -- dims the background color of inactive window
				shade = "dark",
				percentage = 0.15, -- percentage of the shade to apply to the inactive window
			},
			no_italic = false, -- Force no italic
			no_bold = false, -- Force no bold
			no_underline = false, -- Force no underline
			styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
				comments = { "italic" }, -- Change the style of comments
				conditionals = { "italic" },
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
			},
			color_overrides = {},
			custom_highlights = {},
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				notify = false,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
				-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
			},
		},
		config = function()
			vim.cmd.colorscheme 'catppuccin'
		end,
	},
	{
		'rose-pine/neovim',
		name = 'rose-pine',
		opts = {
			-- rose-pine options
			--- @usage 'auto'|'main'|'moon'|'dawn'
			variant = 'auto',
			--- @usage 'main'|'moon'|'dawn'
			dark_variant = 'main',
			bold_vert_split = false,
			dim_nc_background = false,
			disable_background = false,
			disable_float_background = false,
			disable_italics = false,

			--- @usage string hex value or named color from rosepinetheme.com/palette
			groups = {
				background = 'base',
				background_nc = '_experimental_nc',
				panel = 'surface',
				panel_nc = 'base',
				border = 'highlight_med',
				comment = 'muted',
				link = 'iris',
				punctuation = 'subtle',

				error = 'love',
				hint = 'iris',
				info = 'foam',
				warn = 'gold',

				headings = {
					h1 = 'iris',
					h2 = 'foam',
					h3 = 'rose',
					h4 = 'gold',
					h5 = 'pine',
					h6 = 'foam',
				}
				-- or set all headings at once
				-- headings = 'subtle'
			},

			-- Change specific vim highlight groups
			-- https://github.com/rose-pine/neovim/wiki/Recipes
			highlight_groups = {
				ColorColumn = { bg = 'rose' },

				-- Blend colours against the "base" background
				CursorLine = { bg = 'foam', blend = 10 },
				StatusLine = { fg = 'love', bg = 'love', blend = 10 },

				-- By default each group adds to the existing config.
				-- If you only want to set what is written in this config exactly,
				-- you can set the inherit option:
				Search = { bg = 'gold', inherit = false },
			}
		},
		config = function()
			-- vim.cmd.colorscheme 'rose-pine'
		end,
	},
	{
		'folke/tokyonight.nvim',
		opts = {
			-- tokyonight options
			style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
			light_style = "day", -- The theme is used when the background is set to light
			transparent = false, -- Enable this to disable setting the background color
			terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
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
		},
		config = function()
			-- vim.cmd.colorscheme 'tokyonight'
		end,
	},
}

-- vim: foldmethod=indent foldlevel=2
