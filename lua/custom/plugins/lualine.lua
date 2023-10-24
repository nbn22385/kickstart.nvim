local mode_map = {
	["n"] = "N",
	["no"] = "O·P",
	["nov"] = "O·P",
	["noV"] = "O·P",
	["no\22"] = "O·P",
	["niI"] = "N·I",
	["niR"] = "N·R",
	["niV"] = "N",
	["nt"] = "N·T",
	["v"] = "V",
	["vs"] = "V",
	["V"] = "V·L",
	["Vs"] = "V·L",
	["\22"] = "V·B",
	["\22s"] = "V·B",
	["s"] = "S",
	["S"] = "S·L",
	["\19"] = "S·B",
	["i"] = "I",
	["ic"] = "I·C",
	["ix"] = "I·X",
	["R"] = "R",
	["Rc"] = "R·C",
	["Rx"] = "R·X",
	["Rv"] = "V·R",
	["Rvc"] = "RVC",
	["Rvx"] = "RVX",
	["c"] = "C",
	["cv"] = "EX",
	["ce"] = "EX",
	["r"] = "R",
	["rm"] = "M",
	["r?"] = "C",
	["!"] = "SH",
	["t"] = "T",
}

local function modes()
	return mode_map[vim.api.nvim_get_mode().mode] or "_"
end

return {
	-- Set lualine as statusline
	'nvim-lualine/lualine.nvim',
	event = "VeryLazy",
	dependencies = { 'nvim-tree/nvim-web-devicons' },

	init = function()
		-- disable until lualine loads
		vim.opt.laststatus = 0
	end,
	opts = {
		options = {
			icons_enabled = true,
			theme = 'auto',
			component_separators = '',
			section_separators = '',
			disabled_filetypes = {
				statusline = {},
				winbar = {},
			},
			symbols = {
				modified = ' ●',
				alternate_file = '#',
				directory = '',
			},
		},
		sections = {
			lualine_a = { modes },
			lualine_b = { 'diff', 'diagnostics' },
			lualine_c = { 'filename' },
			lualine_x = { 'location', 'progress' },
			lualine_y = { { 'branch', icon = '' } },
			lualine_z = {}
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { 'filename' },
			lualine_x = { 'location' },
			lualine_y = {},
			lualine_z = {}
		},
	},
}
