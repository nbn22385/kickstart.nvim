return {
	'nvim-telescope/telescope.nvim',
	branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		-- Fuzzy Finder Algorithm which requires local dependencies to be built.
		-- Only load if `make` is available. Make sure you have the system
		-- requirements installed.
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			-- NOTE: If you are having trouble with this installation,
			--       refer to the README for telescope-fzf-native for more instructions.
			build = 'make',
			cond = function()
				return vim.fn.executable 'make' == 1
			end,
		},
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local no_preview = function()
			return require('telescope.themes').get_ivy({
				borderchars = {
					{ '─', '│', '─', '│', '┌', '┐', '┘', '└' },
					prompt = { "─", "│", " ", "│", '┌', '┐', "│", "│" },
					results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
					preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
				},
				layout_config = {
					height = 0.5,
					width = 0.5,
				},
				entry_prefix = '  ',
				multi_icon = '✓ ',
				selection_caret = '▶ ',
				previewer = false,
				results_title = '',
			})
		end

		telescope.setup {
			defaults = {
				mappings = {
					i = {
						['<C-c>'] = require('telescope.actions').close,
						['<C-x>'] = require('telescope.actions.layout').toggle_preview,
						['<C-u>'] = false,
						['<C-d>'] = false,
					},
				},
			},
		}

		vim.keymap.set('n', '<leader>?', function() builtin.oldfiles(no_preview()) end, { desc = '[?] Find recently opened files' })
		vim.keymap.set('n', '<leader><space>', function() builtin.buffers(no_preview()) end, { desc = '[ ] Find existing buffers' })
		vim.keymap.set('n', '<leader>/', function() builtin.current_buffer_fuzzy_find(no_preview()) end, { desc = '[/] Fuzzy find in current buffer' })
		vim.keymap.set('n', '<leader>f', function() builtin.git_files(no_preview()) end, { desc = 'Find Git [f]iles' })
		vim.keymap.set('n', '<leader>F', function() builtin.find_files(no_preview()) end, { desc = 'Find All [F]iles' })
		vim.keymap.set('n', '<leader>H', function() builtin.help_tags(no_preview()) end, { desc = 'Find [h]elptags' })
		vim.keymap.set('n', '<leader>W', function() builtin.grep_string(no_preview()) end, { desc = 'Find current [w]ord' })
		vim.keymap.set('n', '<leader>g', function() builtin.live_grep(no_preview()) end, { desc = 'Find by [g]rep' })
		vim.keymap.set('n', '<leader>d', function() builtin.diagnostics(no_preview()) end, { desc = 'Find [d]iagnostics' })
		vim.keymap.set('n', '<leader>r', function() builtin.resume(no_preview()) end, { desc = 'Find [r]esume' })
		vim.keymap.set('n', '<leader>C', function() builtin.colorscheme(no_preview()) end, { desc = 'Find [C]olorschemes' })

		telescope.load_extension("fzf")
	end,
}
