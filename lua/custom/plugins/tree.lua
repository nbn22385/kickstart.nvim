return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup {
			update_focused_file = {
				enable = true,
			},
		}

		-- https://github.com/nvim-tree/nvim-tree.lua/wiki/Auto-Close#ppwwyyxx
		vim.api.nvim_create_autocmd("QuitPre", {
			callback = function()
				local invalid_win = {}
				local wins = vim.api.nvim_list_wins()
				for _, w in ipairs(wins) do
					local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
					if bufname:match("NvimTree_") ~= nil then
						table.insert(invalid_win, w)
					end
				end
				if #invalid_win == #wins - 1 then
					-- Should quit, so we close all invalid windows.
					for _, w in ipairs(invalid_win) do vim.api.nvim_win_close(w, true) end
				end
			end
		})

		local api = require("nvim-tree.api")
		vim.keymap.set('n', '<leader>e', api.tree.toggle, { desc = 'Toggle nvim-tree' })
	end,
}
