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
      max_prefix_length = 15,
      tab_size = 20,
      offsets = {
        {
          filetype = "NnnExplorer",
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
      show_close_icon = true,
      show_tab_indicators = true,
      persist_buffer_sort = true,
      separator_style = "thick",
      enforce_regular_tabs = false,
      always_show_bufferline = true,
      sort_by = "directory", 
      view = "multiwindow",
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

vim.api.nvim_set_keymap('n', '[b', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ']b', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
