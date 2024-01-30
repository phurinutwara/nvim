return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      local lualine = require 'lualine'
      local catpuccin = require 'catppuccin.utils.lualine'()

      -- Config
      local config = {
        options = {
          -- Disable sections and component separators
          theme = catpuccin,
          component_separators = '|',
          section_separators = {
            left = '',
            right = '',
          },
        },
      }

      lualine.setup(config)
    end,
  },
}
