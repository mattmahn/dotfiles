vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- move by visual line unless count is specified
keymap('n', 'j', 'v:count ? "j" : "gj"', { expr = true, noremap = true, silent = true })
keymap('n', 'k', 'v:count ? "k" : "gk"', { expr = true, noremap = true, silent = true })

-- Movement among splits
---- terminal mode
keymap('t', '<M-h>', '<C-\\><C-n><C-w>h', opts)
keymap('t', '<M-j>', '<C-\\><C-n><C-w>j', opts)
keymap('t', '<M-k>', '<C-\\><C-n><C-w>k', opts)
keymap('t', '<M-l>', '<C-\\><C-n><C-w>l', opts)
---- insert mode
keymap('i', '<M-h>', '<Esc><C-w>h', opts)
keymap('i', '<M-j>', '<Esc><C-w>j', opts)
keymap('i', '<M-k>', '<Esc><C-w>k', opts)
keymap('i', '<M-l>', '<Esc><C-w>l', opts)
---- visual mode
keymap('v', '<M-h>', '<Esc><C-w>h', opts)
keymap('v', '<M-j>', '<Esc><C-w>j', opts)
keymap('v', '<M-k>', '<Esc><C-w>k', opts)
keymap('v', '<M-l>', '<Esc><C-w>l', opts)
---- normal mode
keymap('n', '<M-h>', '<C-w>h', opts)
keymap('n', '<M-j>', '<C-w>j', opts)
keymap('n', '<M-k>', '<C-w>k', opts)
keymap('n', '<M-l>', '<C-w>l', opts)
