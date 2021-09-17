-- local opions
local opt = vim.opt
local cmd = vim.cmd;

opt.background = 'dark' 
opt.clipboard = 'unnamedplus'
opt.completeopt = 'menuone,noinsert,noselect'
opt.mouse = 'a'
opt.number = true
opt.relativenumber = true
opt.signcolumn = 'yes'
opt.shiftwidth = 2
vim.o.shortmess = vim.o.shortmess .. 'c'
opt.smartcase = true
opt.splitright = true
opt.splitbelow = true
opt.hidden = true
opt.ignorecase = true

-- Indent options
opt.smartindent = true
opt.expandtab = true
opt.tabstop = 2
opt.wrap = false

cmd[[colorscheme tokyonight]]
