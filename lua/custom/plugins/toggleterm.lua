return {
  {
    'akinsho/toggleterm.nvim',
    config = function()
      require('toggleterm').setup()
    end,
    keys = {
      { '<leader>tt', ':ToggleTerm<CR>', desc = '[T]oggle [T]erminal' },
    },
  },
}
