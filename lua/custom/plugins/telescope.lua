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
		local no_preview = function(prompt_pre)
			prompt_pre = prompt_pre == nil and ' : ' or prompt_pre .. ': '
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
				multi_icon = '✓ ',
				selection_caret = '▶ ',
				previewer = false,
				results_title = false,
				prompt_title = false,
				prompt_prefix = prompt_pre,
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

		local fuzzyFindFiles = function()
			local path = vim.fn.expand("%:p")
			builtin.grep_string(
				no_preview("Fuzzy grep"),
				{
					cwd = require("lspconfig/util").root_pattern(".git")(path),
					path_display = { 'smart' },
					only_sort_text = true,
					word_match = '-w',
					search = '',
				}
			)
		end

		vim.keymap.set('n', '<leader>R', function() fuzzyFindFiles() end, {})
		vim.keymap.set('n', '<leader>h', function() builtin.oldfiles(no_preview('Old files')) end, { desc = '[?] Find recently opened files' })
		vim.keymap.set('n', '<leader>b', function() builtin.buffers(no_preview('Buffers')) end, { desc = '[ ] Find existing buffers' })
		vim.keymap.set('n', '<leader>/', function() builtin.current_buffer_fuzzy_find(no_preview('Find in buffer')) end, { desc = '[/] Fuzzy find in current buffer' })
		vim.keymap.set('n', '<leader>f', function() builtin.git_files(no_preview('Git files')) end, { desc = 'Find Git [f]iles' })
		vim.keymap.set('n', '<leader>F', function() builtin.find_files(no_preview('All files')) end, { desc = 'Find All [F]iles' })
		vim.keymap.set('n', '<leader>H', function() builtin.help_tags(no_preview('Help tags')) end, { desc = 'Find [h]elptags' })
		vim.keymap.set('n', '<leader>W', function() builtin.grep_string(no_preview('Find current word')) end, { desc = 'Find current [w]ord' })
		vim.keymap.set('n', '<leader>g', function() builtin.live_grep(no_preview('Find in files')) end, { desc = 'Find by [g]rep' })
		vim.keymap.set('n', '<leader>d', function() builtin.diagnostics(no_preview('Diagnostics')) end, { desc = 'Find [d]iagnostics' })
		vim.keymap.set('n', '<leader>r', function() builtin.resume(no_preview('Find (resume)')) end, { desc = 'Find [r]esume' })
		vim.keymap.set('n', '<leader>C', function() builtin.colorscheme(no_preview('Colorschemes')) end, { desc = 'Find [C]olorschemes' })

		telescope.load_extension("fzf")
	end,
}
