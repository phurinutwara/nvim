return {
  {
    'folke/twilight.nvim',
    lazy = false,
    keys = {
      {
        '<leader>tw',
        [[:Twilight<CR>]],
        { mode = 'n', desc = 'Toggle [T][w]ilight' },
      },
    },
    opts = {},
    config = function(opts)
      local twilight = require 'twilight'
      twilight.setup { opts }
    end,
  },
}
