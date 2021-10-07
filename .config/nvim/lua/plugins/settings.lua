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
require('bufferline').setup({
  options = {
      numbers = function(opts)
        return string.format("%s", opts.id)
      end,
      indicator_icon = "▎",
      buffer_close_icon = "",
      modified_icon = "●",
      close_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",
      max_name_length = 20,
      max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
      tab_size = 25,
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "center",
        },
        {
          filetype = "minimap",
          text = "Minimap",
          text_align = "center",
        },
        {
          filetype = "Outline",
          text = "Symbols",
          text_align = "center",
        },
        {
          filetype = "packer",
          text = "Plugins manager",
          text_align = "center",
        },
      },
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = false,
      show_tab_indicators = true,
      persist_buffer_sort = true,
      separator_style = "thick",
      enforce_regular_tabs = true,
      always_show_bufferline = false,
      sort_by = "directory",
      custom_areas = {
        right = function()
          local result = {}
          local error = vim.lsp.diagnostic.get_count(0, [[Error]])
          local warning = vim.lsp.diagnostic.get_count(0, [[Warning]])
          local info = vim.lsp.diagnostic.get_count(0, [[Information]])
          local hint = vim.lsp.diagnostic.get_count(0, [[Hint]])

          if error ~= 0 then
            result[1] = {
              text = "  " .. error,
              guifg = "#ff6c6b",
            }
          end

          if warning ~= 0 then
            result[2] = {
              text = "  " .. warning,
              guifg = "#ECBE7B",
            }
          end

          if hint ~= 0 then
            result[3] = {
              text = "  " .. hint,
              guifg = "#98be65",
            }
          end

          if info ~= 0 then
            result[4] = {
              text = "  " .. info,
              guifg = "#51afef",
            }
          end
          return result
        end,
      },
    },
}) 

require('neoscroll').setup()
require'nvim-tree'.setup({
  view = {
    auto_resize = true
  }
})
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
require('telescope').load_extension('projects')
require('telescope').load_extension('dap')

require('commented').setup()
require('focus').setup()

require('dapui').setup()

require('code_runner').setup({})

vim.g.hardtime_default_on = 1
