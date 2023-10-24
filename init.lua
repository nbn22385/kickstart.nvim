-- [[ Plugin manager ]] {{{
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

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

-- vim.opt.path=$PWD/**                   -- Find all files under this directory
vim.opt.breakindent = true -- Enable break indent
vim.opt.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim.
vim.opt.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience
vim.opt.fillchars:append("eob: ") -- Empty lines below the end of a buffer
vim.opt.fillchars:append("fold: ") -- Filling 'foldtext'
vim.opt.fillchars:append("foldopen:┬") -- Mark the beginning of a fold
vim.opt.fillchars:append("foldsep:│") -- Open fold middle character
vim.opt.foldopen:append({ 'jump' }) -- Open a fold if we jump inside it
vim.opt.hlsearch = true -- Set highlight on search
vim.opt.ignorecase = true -- Case-insensitive searching
vim.opt.iskeyword:remove({ '-' }) -- Treat dash separated words as a word text object
vim.opt.listchars:append({ eol = '↵' }) -- Characters to show in 'list' mode
vim.opt.listchars:append({ tab = '▸ ' }) -- Characters to show in 'list' mode
vim.opt.listchars:append({ trail = '·' }) -- Characters to show in 'list' mode
vim.opt.matchpairs:append({ "<:>" }) -- Add angle brackets to list of matching pairs
vim.opt.mouse = 'a' -- Enable mouse mode
vim.opt.mouse = a -- Enable use of the mouse in all modes
vim.opt.nrformats = '' -- Only recognize decimal numbers for increment/decrement
vim.opt.number = true -- Make line numbers default
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

-- Keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>')

-- Save a file
vim.keymap.set('n', '<Leader>w', ':w<CR>')

-- Go to first file on the line
vim.keymap.set('n', '<Leader>gf', '^f/gf')

-- Replace all occurrences of word under cursor
vim.keymap.set('n', '<Leader>h', ':%s/<C-r><C-w>//g<Left><Left>')

-- Open new line and stay in normal mode
vim.keymap.set('n', '<Leader>o', 'o<ESC>')
vim.keymap.set('n', '<Leader>O', 'O<ESC>')

-- Use wildmenu to quickly switch buffers
vim.keymap.set('n', '<Leader><Tab>', ':buffer<Space><Tab>')

-- Format entire file
vim.keymap.set('n', '<Leader>=', 'gg=G<C-o><C-o>')

-- Open lazygit in a new tab
vim.keymap.set('n', '<Leader>G', ':$tab terminal lazygit<CR>')
vim.api.nvim_create_autocmd('TermOpen', { pattern = { '*' }, command = 'startinsert' })

-- Quicker split resizing
vim.keymap.set('n', '<Leader><Left>', ':vertical resize -3<CR>')
vim.keymap.set('n', '<Leader><Right>', ':vertical resize +3<CR>')
vim.keymap.set('n', '<Leader><Up>', ':resize +3<CR>')
vim.keymap.set('n', '<Leader><Down>', ':resize -3<CR>')

-- Toggle between alternate files
vim.keymap.set('n', '<Backspace>', '<C-^>')
--
-- Add relative vertical movements to the jumplist
vim.keymap.set('n', 'j', function()
  return vim.v.count > 1 and "m'" .. vim.v.count .. "gj" or "gj"
end, { expr = true })
vim.keymap.set('n', 'k', function()
  return vim.v.count > 1 and "m'" .. vim.v.count .. "gk" or "gk"
end, { expr = true })

-- Change operations are directed to the black hole register
vim.keymap.set('n', 'c', '"_c')
vim.keymap.set('n', 'C', '"_C')

-- Joining lines will keep cursor position
vim.keymap.set('n', 'J', 'mzJ`z')

-- Disable vim's exit message when pressing C-c
vim.keymap.set('n', '<C-c>', '<Esc>')

-- +/- -> Increment/decrement numbers in normal or visual mode
vim.keymap.set('n', '+', '<C-a>')
vim.keymap.set('n', '-', '<C-x>')
vim.keymap.set('x', '+', 'g<C-a>gv')
vim.keymap.set('x', '-', 'g<C-x>gv')

-- <CTRL-W>h/j/k/l -> Move windows left/up/down/right
vim.keymap.set('n', '<C-w>h', '<C-w>H')
vim.keymap.set('n', '<C-w>j', '<C-w>J')
vim.keymap.set('n', '<C-w>k', '<C-w>K')
vim.keymap.set('n', '<C-w>l', '<C-w>L')

-- Navigate buffers
vim.keymap.set('n', '[B', ':bfirst<CR>', { silent = true })
vim.keymap.set('n', ']b', ':bnext<CR>', { silent = true })
vim.keymap.set('n', '[b', ':bprevious<CR>', { silent = true })
vim.keymap.set('n', ']B', ':blast<CR>', { silent = true })

-- Navigate location list entries
vim.keymap.set('n', '[L', ':lfirst<CR>zz', { silent = true })
vim.keymap.set('n', ']l', ':lnext<CR>zz', { silent = true })
vim.keymap.set('n', '[l', ':lprevious<CR>zz', { silent = true })
vim.keymap.set('n', ']L', ':llast<CR>zz', { silent = true })

-- Navigate quickfix list entries
vim.keymap.set('n', '[Q', ':cfirst<CR>zz', { silent = true })
vim.keymap.set('n', ']q', ':cnext<CR>zz', { silent = true })
vim.keymap.set('n', '[q', ':cprevious<CR>zz', { silent = true })
vim.keymap.set('n', ']Q', ':clast<CR>zz', { silent = true })

-- Exit insert mode faster
vim.keymap.set('i', '<C-c>', '<Esc>l')
vim.keymap.set('i', '<Esc>', '<Esc>l')
vim.keymap.set('i', 'kj', '<Esc>l')

-- Command line begin/end line
vim.keymap.set('c', '<C-a>', '<Home>')
vim.keymap.set('c', '<C-e>', '<End>')

-- Navigate through partial search matches with Tab/S-Tab
vim.keymap.set('c', '<Tab>', "getcmdtype() =~ '[/?]' ? '<C-g>' : '<Tab>'", { expr = true })
vim.keymap.set('c', '<S-Tab>', "getcmdtype() =~ '[/?]' ? '<C-t>' : '<S-Tab>'", { expr = true })

-- Don't overwrite paste buffer when pasting over visual selection
vim.keymap.set('x', 'p', '_dP')

-- Replace all occurrences of visual selection
vim.keymap.set('x', '<Leader>h', 'y:%s/<C-r>0//g<Left><Left>')
-- }}}

-- [[ Autocommands ]] {{{

-- Highlight on yank
local init_group = vim.api.nvim_create_augroup('init', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = init_group,
  pattern = '*',
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
-- }}}

-- vim: fdm=marker ts=2 sts=2 sw=2 et
