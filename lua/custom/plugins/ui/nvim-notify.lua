return {
  {
    'rcarriga/nvim-notify',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    lazy = false,
    keys = {
      {
        '<leader>rs',
        function()
          require('notify').dismiss {}
        end,
        desc = '[S]ilent notify (dismiss)',
      },
    },
    config = function()
      require('notify').setup {
        fps = 120,
        render = 'wrapped-compact',
        minimum_width = 25,
      }
      vim.notify = require 'notify'
    end,
  },
}
