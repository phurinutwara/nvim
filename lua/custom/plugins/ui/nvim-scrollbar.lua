return {
  'petertriho/nvim-scrollbar',
  config = function()
    if package.loaded['catppuccin'] then
      local colors = require('catppuccin.palettes').get_palette 'mocha'
      require('scrollbar').setup {
        handle = {
          color = colors.surface2,
        },
      }
    elseif package.loaded['tokyonight'] then
      local colors = require('tokyonight.colors').setup()
      require('scrollbar').setup {
        handle = {
          color = colors.bg_highlight,
        },
        marks = {
          Search = { color = colors.orange },
          Error = { color = colors.error },
          Warn = { color = colors.warning },
          Info = { color = colors.info },
          Hint = { color = colors.hint },
          Misc = { color = colors.purple },
        },
      }
    end
  end,
}
