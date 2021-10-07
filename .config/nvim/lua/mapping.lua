
-- Mapping
map = vim.api.nvim_set_keymap

map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})

map('n', '<Leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>", {noremap = true})
map('n', '<Leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>", {noremap = true})
map('n', '<Leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>", {noremap = true})
map('n', '<Leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>", {noremap = true})

map('n', '<Leader>ca', "<cmd>lua require('lspsaga.codeaction').code_action()<cr>", {noremap = true})
map('v', '<Leader>ca', ":<C-U>lua require('lspsaga.codeaction').range_code_action()<cr>", {noremap = true})

map('n', '<Leader>tt', "<cmd>:NvimTreeToggle<CR>", {})

map("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true}
)
map("n", "<leader>xw", "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
map("n", "<leader>xd", "<cmd>TroubleToggle lsp_document_diagnostics<cr>",
  {silent = true, noremap = true}
)
map("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
  {silent = true, noremap = true}
)
map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)
map("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
  {silent = true, noremap = true}
)

map('n', '<c-l>', ":lua require('focus').split_nicely()<CR>", { silent = true })

