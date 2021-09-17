
-- Mapping
map = vim.api.nvim_set_keymap

map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
map('n', '<Leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>", {noremap = true})
-- map('n', '<Leader>tt', "<cmd>:NvimTreeToggle<CR>", {})
