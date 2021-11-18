-- Mapping
local map = vim.api.nvim_set_keymap
map('n', '<Leader>dg', "<cmd>:NnnExplorer %:p:h<CR>", { noremap = true})

map('i', '<C-s>',    '<ESC>:w <CR>', { noremap=true, silent=true })
map('n', '<C-s>',    '<ESC>:w <CR>', { noremap=true, silent=true })

map('v', '<',   '<gv', { noremap=true, silent=true })
map('v', '>',   '>gv', { noremap=true, silent=true })

map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
-- Trouble --
map("n", "<leader>xx", "<cmd>Trouble<cr>",
  {silent = true, noremap = true}
)
map("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
map("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>",
  {silent = true, noremap = true}
)
map("n", "<leader>xl", "<cmd>Trouble loclist<cr>",
  {silent = true, noremap = true}
)
map("n", "<leader>xq", "<cmd>Trouble quickfix<cr>",
  {silent = true, noremap = true}
)
map("n", "gR", "<cmd>Trouble lsp_references<cr>",
  {silent = true, noremap = true}
)

map("n", "<leader>S", "<cmd>:lua require('spectre').open()<cr>",
  {silent = true, noremap = true}
)
map("n", "<leader>sw", "<cmd>:lua require('spectre').open_visual({select_word=true})<cr>",
  {silent = true, noremap = true}
)
map("v", "<leader>s", "<cmd>:lua require('spectre').open_visual()<cr>",
  {silent = true, noremap = true}
)
map("n", "<leader>sp", "<cmd>viw:lua require('spectre').open_file_search()<cr>",
  {silent = true, noremap = true}
)

map('n', '<c-l>', ":lua require('focus').split_nicely()<CR>", { silent = true })

map('n', '<c-t>', '<cmd>exe v:count1 . "ToggleTerm"<CR>', {silent = true, noremap = true})
map('i', '<c-t>', '<esc><cmd>exe v:count1 . "ToggleTerm"<CR>', {silent = true})
