vim.cmd[[colorscheme tokyonight]]

require'nvim-web-devicons'.setup {
  default = true;
}

require('nnn').setup()
require('toggleterm').setup {}
require('lightspeed').setup {}

require('neoscroll').setup()
require('focus').setup()

require('rest-nvim').setup({
  result_split_horizontal = false,
  skip_ssl_verification = false,
  highlight = {
    enabled = true,
    timeout = 150,
  },
  result = {
    show_url = true,
    show_http_info = true,
    show_headers = true,
  },
  jump_to_request = false,
})

require('indent_blankline').setup {
  indentLine_enabled = 1,
  space_char_blankline = ' ',
  buftype_exclude = { 'terminal' },
  show_current_context = true,
}

require('stabilize').setup()

require'marks'.setup {
  default_mappings = true, -- whether to map keybinds or not. default true
  builtin_marks = { ".", "<", ">", "^" }, -- which builtin marks to show. default {}
  cyclic = true, -- whether movements cycle back to the beginning/end of buffer. default true
  force_write_shada = false, -- whether the shada file is updated after modifying uppercase marks. default false
  bookmark_0 = { -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own sign/virttext
    sign = "⚑",
    virt_text = ""
  },
  mappings = {}
}

require('mkdnflow').setup({})
require('nvim-gps').setup()
require('spectre').setup()

