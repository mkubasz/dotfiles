local map = vim.api.nvim_set_keymap

map('n', '<Leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>", {noremap = true})
map('n', '<Leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>", {noremap = true})
map('n', '<Leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>", {noremap = true})
map('n', '<Leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>", {noremap = true})

local ignore_these = {
  'node_modules/.*',
  '.yarn/.*',
  '.neuron/*',
  'fonts/*',
  'icons/*',
  'images/*',
  'dist/*',
  'build/*',
  'yarn.lock',
  'package%-lock.json',
}
local default_picker_opts = {
  file_browser = {
    prompt_title = 'working directory',
    selection_strategy = 'row',
  },
  grep_string = {
    prompt_title = 'word under cursor',
  },
  live_grep = {
    file_ignore_patterns = ignore_these,
  },
}

require('telescope').setup {
  pickers = default_picker_opts,
}

