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
      require('twilight').setup { opts }

      vim.api.nvim_create_autocmd({ 'BufEnter' }, {
        pattern = { '*.*' },
        command = [[TwilightEnable]],
      })
    end,
  },
}
