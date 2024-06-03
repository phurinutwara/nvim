return {
  {
    'folke/trouble.nvim',
    config = function()
      require('trouble').setup {}
    end,
    keys = {
      { '<leader>t ', ':Trouble<CR>', desc = '[T]rouble Menu' },
      { '<leader>td', ':Trouble diagnostics<CR>', desc = '[T]rouble [D]iagnostic' },
    },
  },
}
