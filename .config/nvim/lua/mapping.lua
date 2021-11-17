local keymap = vim.api.nvim_set_keymap

keymap('i', '<C-s>',    '<ESC>:w <CR>', { noremap=true, silent=true })
keymap('n', '<C-s>',    '<ESC>:w <CR>', { noremap=true, silent=true })
keymap('v', '<',   '<gv', { noremap=true, silent=true })
keymap('v', '>',   '>gv', { noremap=true, silent=true })
keymap('v', 'J', ":m '>+1<CR>gv=gv", {noremap=true, silent=true})
keymap('v', 'K', ":m '<-2<CR>gv=gv", {noremap=true, silent=true})

