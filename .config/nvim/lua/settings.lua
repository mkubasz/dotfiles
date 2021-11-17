-- local opions
local opt = vim.opt
local cmd = vim.cmd;
local o = vim.o

o.shortmess = o.shortmess .. 'c'
opt.background = 'dark' 
opt.clipboard = opt.clipboard + 'unnamedplus'
opt.completeopt = 'menuone,noinsert,noselect'
opt.mouse = 'a'
opt.number = true
opt.relativenumber = true
opt.signcolumn = 'yes'
opt.shiftwidth = 2
opt.smartcase = true
opt.splitright = true
opt.splitbelow = true
opt.hidden = true
opt.ignorecase = true
opt.hlsearch = true

-- Indent options
opt.smartindent = true
opt.expandtab = false
opt.smarttab = true
opt.tabstop = 2
opt.wrap = false

vim.cmd('set shell=/bin/bash')

-- 2 spaces for selected filetypes
cmd([[ autocmd FileType xml,html,xhtml,css,scssjavascript,lua,dart setlocal shiftwidth=2 tabstop=2 ]])
-- 4 spaces for selected filetypes
cmd([[ autocmd FileType python,c,cpp setlocal shiftwidth=4 tabstop=4 ]])
-- 8 spaces for Go files
cmd([[ autocmd FileType go setlocal shiftwidth=8 tabstop=8 ]])

-- python
cmd([[ au BufEnter *.py set ai sw=4 ts=4 sta et fo=croql ]])
-- C/C++
cmd([[ au BufEnter *.c,*.cpp,*cxx,*C,*CPP set ai sw=4 ts=4 sta fo=croql ]])
-- lua
cmd([[ au BufEnter *.lua set ai expandtab shiftwidth=2 tabstop=2 sta fo=croql ]])
-- vim
cmd([[ au BufEnter *.vim set ai expandtab shiftwidth=2 tabstop=2 sta fo=croql ]])
-- json
cmd([[ au BufEnter *.json set ai expandtab shiftwidth=2 tabstop=2 sta fo=croql ]])
