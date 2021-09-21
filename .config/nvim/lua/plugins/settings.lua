local fn = vim.fn
local g = vim.g

require'nvim-web-devicons'.setup {
  default = true;
}

require('feline').setup {
  colors = {
    bg = '#282c34',
    fg = '#abb2bf'
  }
}

vim.opt.termguicolors = true
require('bufferline').setup {}

require('neoscroll').setup()

require('gitsigns').setup {
	signs = {
		add = { text = '▎' },
		change = { text = '▎' },
		delete = { text = '契' },
		topdelete = { text = '契' },
		changedelete = { text = '▎' },
	},
}

require('indent_blankline').setup {
  indentLine_enabled = 1,
  space_char_blankline = ' ',
  buftype_exclude = { 'terminal' },
  show_current_context = true,
}

require('nvim-autopairs').setup()

require('mkdnflow').setup({})

require('nvim-treesitter.configs').setup {
  indent = {
    enable = true
  },
  refactor = {
    highlight_definitions = { enable = true },
  },
  highlight = {
    enable = true,
    use_language = true,
  },
  context_commentstring = {
    enable = true,
    -- This plugin provided an autocommand option
    enable_autocmd = true,
  }
}

local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()
parser_configs.http = {
  install_info = {
    url = 'https://github.com/NTBBloodbath/tree-sitter-http',
    files = { 'src/parser.c' },
    branch = 'main',
  },
}

vim.cmd('set shell=/bin/bash')

require('telescope').load_extension('fzf')

require('commented').setup()
require('focus').setup()
