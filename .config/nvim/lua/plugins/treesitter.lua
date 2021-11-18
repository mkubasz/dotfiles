require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  refactor = {
    highlight_definitions = { enable = true },
  },
  tree_docs = {enable = true}
}

require('spellsitter').setup()
require('telescope').load_extension('fzf')

