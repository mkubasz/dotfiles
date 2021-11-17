vim.cmd[[colorscheme tokyonight]]

require('nnn').setup()
require('toggleterm').setup{}
require'lightspeed'.setup {}

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
require('marks').setup {}
