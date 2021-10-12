
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


vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='🟦', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='⭐️', texthl='', linehl='', numhl=''})
map('n', '<leader>dh', ':lua require"dap".toggle_breakpoint()<CR>', {silent = true, noremap = true})
map('n', '<leader>dH', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", {silent = true, noremap = true})
map('n', '<c-k>', ':lua require"dap".step_out()<CR>', {silent = true, noremap = true})
map('n', '<c-l>', ':lua require"dap".step_into()<CR>', {silent = true, noremap = true})
map('n', '<c-j>', ':lua require"dap".step_over()<CR>', {silent = true, noremap = true})
map('n', '<c-h>', ':lua require"dap".continue()<CR>', {silent = true, noremap = true})
map('n', '<leader>dk', ':lua require"dap".up()<CR>', {silent = true, noremap = true})
map('n', '<leader>dj', ':lua require"dap".down()<CR>', {silent = true, noremap = true})
map('n', '<leader>dc', ':lua require"dap".disconnect({ terminateDebuggee = true });require"dap".close()<CR>', {silent = true, noremap = true})
map('n', '<leader>dr', ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l', {silent = true, noremap = true})
map('n', '<leader>di', ':lua require"dap.ui.variables".hover()<CR>', {silent = true, noremap = true})
map('n', '<leader>di', ':lua require"dap.ui.variables".visual_hover()<CR>', {silent = true, noremap = true})
map('n', '<leader>d?', ':lua require"dap.ui.variables".scopes()<CR>', {silent = true, noremap = true})
map('n', '<leader>de', ':lua require"dap".set_exception_breakpoints({"all"})<CR>', {silent = true, noremap = true})
map('n', '<leader>da', ':lua require"debugHelper".attach()<CR>', {silent = true, noremap = true})
map('n', '<leader>dA', ':lua require"debugHelper".attachToRemote()<CR>', {silent = true, noremap = true})
map('n', '<leader>di', ':lua require"dap.ui.widgets".hover()<CR>', {silent = true, noremap = true})
map('n', '<leader>d?', ':lua local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes)<CR>', {silent = true, noremap = true})

map('n', '<c-t>', '<cmd>exe v:count1 . "ToggleTerm"<CR>', {silent = true, noremap = true})
map('i', '<c-t>', '<esc><cmd>exe v:count1 . "ToggleTerm"<CR>', {silent = true})
