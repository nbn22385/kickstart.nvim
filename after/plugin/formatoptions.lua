-- Disable auto-commenting using the following flags:
-- c : when wrapping a comment line
-- r : when pressing Enter
-- o : when using o or O command

local formatopts = vim.api.nvim_create_augroup('formatopts', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
  group = formatopts,
  pattern = '*',
  callback = function()
		vim.opt.formatoptions:remove { "c", "r", "o" }
  end,
})
