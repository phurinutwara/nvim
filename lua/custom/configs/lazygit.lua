return {
  'lazygit.lua',
  dev = true,
  dependencies = {
    'akinsho/toggleterm.nvim',
  },
  keys = {
    { '<leader>lg', '<cmd>lua _lazygit_toggle()<CR>', { desc = 'Toggle [L]azy[G]it' } },
  },
  config = function()
    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new {
      cmd = 'lazygit',
      direction = 'float',
      hidden = true,
    }

    function _lazygit_toggle()
      lazygit:toggle()
    end
  end,
}
