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

local function progressbar()
	local chars = { '█', '▇', '▆', '▅', '▄', '▃', '▂', '▁', '' }
	local line_ratio = 1.0 * vim.fn.line('.') / vim.fn.line('$')
	local index = vim.fn.float2nr(vim.fn.ceil(line_ratio * (vim.fn.len(chars) - 1)))
	return chars[index]
end

local function spellstatus()
	return vim.opt.spell:get() and 'SPELL' or ''
end

local function lsp_info()
	local lsps = vim.lsp.get_active_clients({ bufnr = vim.fn.bufnr() })
	if lsps and #lsps > 0 then
		local names = {}
		for _, lsp in ipairs(lsps) do
			table.insert(names, lsp.name)
		end
		return string.format("%s", table.concat(names, ", "))
	else
		return ""
	end
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
			disabled_filetypes = { 'NvimTree', 'qf' },
			symbols = {
				modified = '',
				alternate_file = '#',
				directory = '',
			},
		},
		sections = {
			lualine_a = { modes },
			lualine_b = {},
			lualine_c = {
				{
					'filename',
					file_status = true,
					path = 1,
					symbols = {
						modified = '',
						readonly = '',
						unnamed = '[No Name]',
						newfile = '[New]',
					}
				}
			},
			lualine_x = { lsp_info, 'diagnostics', spellstatus, 'location', 'progress', progressbar },
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
