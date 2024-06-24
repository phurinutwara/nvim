return {
  'lazygit.lua',
  dev = true,
  dependencies = {
    'akinsho/toggleterm.nvim',
  },
  keys = {
    { '<leader>gl', '<cmd>lua _lazygit_toggle()<CR>', desc = 'Toggle [L]azy[G]it' },
  },
  config = function()
    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new {
      cmd = 'lazygit',
      display_name = 'lazygit',
      direction = 'float',
      hidden = true,
      insert_mappings = false,
      terminal_mappings = false,
      start_in_insert = true,

      on_open = function(term)
        vim.notify_once(term.name)
        vim.keymap.set('t', '<esc>', [[<esc>]], { buffer = term.bufnr })
        vim.keymap.set('t', '<esc><esc>', [[<nop>]], { buffer = term.bufnr })
      end,
    }

    function _lazygit_toggle()
      lazygit:toggle()
    end
  end,
}
