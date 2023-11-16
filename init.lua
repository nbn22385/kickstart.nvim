-- [[ Plugin manager ]] {{{
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  { import = 'custom.plugins' },
}, {})
-- }}}

-- [[ Options ]] {{{

vim.opt.breakindent = true -- Enable break indent
vim.opt.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim.
vim.opt.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience
vim.opt.fillchars:append({ foldopen = '', foldclose = '', fold = ' ', foldsep = ' ', eob = ' ' })
vim.opt.foldcolumn = 'auto' -- resize to the minimum amount of folds
vim.opt.foldopen:append({ 'jump' }) -- Open a fold if we jump inside it
vim.opt.hlsearch = true -- Set highlight on search
vim.opt.ignorecase = true -- Case-insensitive searching
vim.opt.iskeyword:remove({ '-' }) -- Treat dash separated words as a word text object
vim.opt.listchars:append({ eol = '↵', space = '·', tab = '▸ ', trail = '·' })
vim.opt.matchpairs:append({ "<:>" }) -- Add angle brackets to list of matching pairs
vim.opt.mouse = 'a' -- Enable use of the mouse in all modes
vim.opt.nrformats = '' -- Only recognize decimal numbers for increment/decrement
vim.opt.number = true -- Show line numbers
vim.opt.scrolloff = 5 -- Show at least 5 lines above and below the cursor
vim.opt.shiftround = true -- >> indents to next multiple of 'shiftwidth'
vim.opt.shiftwidth = 2 -- >> indents by 2 spaces
vim.opt.shortmess = 'acFIT' -- Customize vim messages
vim.opt.showmode = false -- Don't show current mode in command-line
vim.opt.signcolumn = 'yes' -- Keep signcolumn on by default
vim.opt.smartcase = true -- Ignore ignorecase if capital letter used in search
vim.opt.softtabstop = 2 -- Tab key indents by 2 spaces
vim.opt.splitbelow = true -- Open new split panes below
vim.opt.splitright = true -- Open new split panes to the right
vim.opt.tabstop = 2 -- Number of spaces that a <Tab> counts for
vim.opt.termguicolors = true -- Enables 24-bit RGB color
vim.opt.textwidth = 0 -- Disable maximum text width
vim.opt.timeoutlen = 300 -- Time for a mapped sequence to complete
vim.opt.undofile = true -- Save undo history
vim.opt.updatetime = 250 -- Shorter CursorHold delay
vim.opt.wildcharm = vim.api.nvim_replace_termcodes('<Tab>', true, true, true):byte() -- Allow wildmenu expansion from macros/remaps
vim.opt.wildignorecase = true -- Case-insensitive completion of commands, filenames
vim.opt.wildmode = "longest:full,full" -- Wildmenu completion mode
vim.opt.wrap = false -- Don't automatically wrap long lines to the window

if vim.fn.executable('rg') then
  vim.opt.grepprg = 'rg --vimgrep --hidden --ignore-case'
  vim.opt.grepformat:prepend('%f:%l:%c:%m')
end
-- }}}

-- [[ Commands ]] {{{

vim.api.nvim_create_user_command('Grep', function(_)
  -- execute 'silent grep! <args> | redraw! | cwindow
end, { desc = 'Grep and open the quickfix window with results' })
-- }}}

-- [[ Keymaps ]] {{{

-- local desc = { desc ='Keymaps for better default experience'}
-- vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', desc)

vim.keymap.set('i', '<C-c>', '<Esc>l', { desc = 'Exit insert mode' })
vim.keymap.set('i', '<Esc>', '<Esc>l', { desc = 'Exit insert mode' })
vim.keymap.set('i', 'kj', '<Esc>l', { desc = 'Exit insert mode' })

vim.keymap.set({ "i", "n" }, "<Esc>", "<Cmd>noh<CR><Esc>",
  { desc = "Escape and clear hlsearch" })

vim.keymap.set('n', '<C-c>', '<Esc>',
  { desc = 'Disable vim\'s exit message when pressing C-c' })

vim.keymap.set('n', '<Leader>w', ':w<CR>',
  { desc = 'Save a file' })

vim.keymap.set('n', '<Leader>G', ':$tabnew | terminal lazygit<CR>',
  { desc = 'Open lazygit in a new tab', silent = true })

vim.keymap.set('n', '<Leader>gf', '^f/gf',
  { desc = 'Go to first file on the line' })

vim.keymap.set('n', '<Leader>h', ':%s/<C-r><C-w>//g<Left><Left>',
  { desc = 'Replace all occurrences of word under cursor' })

vim.keymap.set('n', '<Leader>O', 'O<ESC>',
  { desc = 'Begin a new line above the cursor and stay in normal mode' })

vim.keymap.set('n', '<Leader>o', 'o<ESC>',
  { desc = 'Begin a new line below the cursor and stay in normal mode' })

vim.keymap.set('n', '<Leader><Tab>', ':buffer<Space><Tab>',
  { desc = 'Use wildmenu to quickly switch buffers' })

vim.keymap.set('n', '<Leader>=', 'gg=G<C-o><C-o>',
  { desc = 'Format entire file' })

vim.keymap.set('n', '<Leader><Left>', ':vertical resize -3<CR>', { desc = 'Decrease vertical split width' })
vim.keymap.set('n', '<Leader><Right>', ':vertical resize +3<CR>', { desc = 'Increase vertical split width' })
vim.keymap.set('n', '<Leader><Up>', ':resize +3<CR>', { desc = 'Increase horizontal split width' })
vim.keymap.set('n', '<Leader><Down>', ':resize -3<CR>', { desc = 'Increase horizontal split width' })

vim.keymap.set('n', '<Backspace>', '<C-^>',
  { desc = 'Toggle between alternate files' })

vim.keymap.set('n', 'j', function() return vim.v.count > 1 and "m'" .. vim.v.count .. "gj" or "gj" end,
  { desc = 'Add relative vertical movements to the jumplist', expr = true })

vim.keymap.set('n', 'k', function() return vim.v.count > 1 and "m'" .. vim.v.count .. "gk" or "gk" end,
  { desc = 'Add relative vertical movements to the jumplist', expr = true })

vim.keymap.set('n', 'J', 'mzJ`z',
  { desc = 'Joining lines will keep cursor position' })

vim.keymap.set('n', '+', '<C-a>', { desc = 'Increment numbers in normal mode' })
vim.keymap.set('n', '-', '<C-x>', { desc = 'Decrement numbers in normal mode' })
vim.keymap.set('x', '+', 'g<C-a>gv', { desc = 'Increment numbers in visual mode' })
vim.keymap.set('x', '-', 'g<C-x>gv', { desc = 'Decrement numbers in visual mode' })

vim.keymap.set('n', '<C-w>h', '<C-w>H', { desc = 'Move window left' })
vim.keymap.set('n', '<C-w>j', '<C-w>J', { desc = 'Move window down' })
vim.keymap.set('n', '<C-w>k', '<C-w>K', { desc = 'Move window up' })
vim.keymap.set('n', '<C-w>l', '<C-w>L', { desc = 'Move window right' })

vim.keymap.set('n', '[B', ':bfirst<CR>', { silent = true, desc = 'Go to first buffer' })
vim.keymap.set('n', ']b', ':bnext<CR>', { silent = true, desc = 'Go to next buffer' })
vim.keymap.set('n', '[b', ':bprevious<CR>', { silent = true, desc = 'Go to previous buffer' })
vim.keymap.set('n', ']B', ':blast<CR>', { silent = true, desc = 'Go to last buffer' })

vim.keymap.set('n', '[L', ':lfirst<CR>zz', { silent = true, desc = 'Go to first location list entry' })
vim.keymap.set('n', ']l', ':lnext<CR>zz', { silent = true, desc = 'Go to next location list entry' })
vim.keymap.set('n', '[l', ':lprevious<CR>zz', { silent = true, desc = 'Go to previous location list entry' })
vim.keymap.set('n', ']L', ':llast<CR>zz', { silent = true, desc = 'Go to last location list entry' })

vim.keymap.set('n', '[Q', ':cfirst<CR>zz', { silent = true, desc = 'Go to first quickfix list entry' })
vim.keymap.set('n', ']q', ':cnext<CR>zz', { silent = true, desc = 'Go to next quickfix list entry' })
vim.keymap.set('n', '[q', ':cprevious<CR>zz', { silent = true, desc = 'Go to previous quickfix list entry' })
vim.keymap.set('n', ']Q', ':clast<CR>zz', { silent = true, desc = 'Go to last quickfix list entry' })

vim.keymap.set('c', '<C-a>', '<Home>', { desc = 'Go to the beginning of the command line' })
vim.keymap.set('c', '<C-e>', '<End>', { desc = 'Go to the end of the command line' })

vim.keymap.set('c', '<Tab>', "getcmdtype() =~ '[/?]' ? '<C-g>' : '<Tab>'",
  { desc = 'Navigate forwards through partial matches', expr = true })
vim.keymap.set('c', '<S-Tab>', "getcmdtype() =~ '[/?]' ? '<C-t>' : '<S-Tab>'",
  { desc = 'Navigate backwards through partial matches', expr = true })

vim.keymap.set('n', 'c', '"_c', { desc = 'Changed text goes to the black hole register' })
vim.keymap.set('n', 'C', '"_C', { desc = 'Changed text goes to the black hole register' })
vim.keymap.set('v', 'c', '"_c', { desc = 'Changed text goes to the black hole register' })
vim.keymap.set('v', 'C', '"_C', { desc = 'Changed text goes to the black hole register' })

vim.keymap.set('x', 'p', '"_dP', { desc = 'Selected text goes to the black hole register when pasting' })

vim.keymap.set('x', '<Leader>h', 'y:%s/<C-r>0//g<Left><Left>',
  { desc = 'Replace all occurrences of text under cursor' })

-- }}}

-- [[ Autocommands ]] {{{

local init_group = vim.api.nvim_create_augroup('init', { clear = true })

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = init_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- When editing a file, always jump to the last known cursor position.
vim.api.nvim_create_autocmd('BufReadPost', {
  group = init_group,
  callback = function(args)
    local valid_line = vim.fn.line([['"]]) >= 1 and vim.fn.line([['"]]) < vim.fn.line('$')
    local not_commit = vim.b[args.buf].filetype ~= 'commit'
    if valid_line and not_commit then
      vim.cmd([[normal! g`"]])
    end
  end,
})

-- Terminal window behavior
vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  group = init_group,
  callback = function()
    vim.opt.number = false
    vim.cmd('startinsert')
  end
})

-- Gracefully close a terminal window
vim.api.nvim_create_autocmd('TermClose', {
  group = init_group,
  command = 'bdelete!' .. vim.fn.expand("<abuf>")
})

-- Resize splits if window gets resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = init_group,
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- vim: fdm=marker ts=2 sts=2 sw=2 et
-- }}}
