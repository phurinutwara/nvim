return {
  {
    'xiyaowong/transparent.nvim',
    lazy = false,
    keys = {
      { '<leader>TT', ':TransparentToggle<CR>', desc = 'Transparent Toggle' },
    },
    configs = function()
      local transparent = require 'transparent'
      transparent.setup()

      transparent.clear_prefix 'BufferLine'
      transparent.clear_prefix 'NeoTree'
      transparent.clear_prefix 'Lualine'
    end,
  },
}
