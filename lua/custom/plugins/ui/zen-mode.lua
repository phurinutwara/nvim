return {
  {
    'folke/zen-mode.nvim',
    lazy = false,
    keys = {
      {
        '<leader>z',
        [[:ZenMode<CR>]],
        { mode = 'n', desc = 'Toggle [Z]en[M]ode' },
      },
    },
    opts = {},
  },
}
