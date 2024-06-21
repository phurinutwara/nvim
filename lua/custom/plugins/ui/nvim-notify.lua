return {
  {
    'rcarriga/nvim-notify',
    dependencies = {
      'nvim-telescope/telescope.nvim',
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
