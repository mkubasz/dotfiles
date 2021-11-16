-- Mapping
local map = vim.api.nvim_set_keymap
map('n', '<Leader>dg', "<cmd>:NnnExplorer %:p:h<CR>", { noremap = true})

map('i', '<C-s>',    '<ESC>:w <CR>', { noremap=true, silent=true })
map('n', '<C-s>',    '<ESC>:w <CR>', { noremap=true, silent=true })

map('v', '<',   '<gv', { noremap=true, silent=true })
map('v', '>',   '>gv', { noremap=true, silent=true })

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