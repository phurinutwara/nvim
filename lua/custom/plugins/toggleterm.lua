return {
  {
    'akinsho/toggleterm.nvim',
    config = function()
      require('toggleterm').setup {
        open_mapping = [[<C-\>]],
        close_on_exit = true,
      }

      local Terminal = require('toggleterm.terminal').Terminal
      Terminal:new { hidden = true }
    end,
  },
}
