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

      -- See more: https://github.com/akinsho/toggleterm.nvim?tab=readme-ov-file#terminal-window-mappings
      function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }
        vim.keymap.set('t', '<esc><esc>', [[<C-\><C-n>]], opts)
        -- vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
        vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
      end

      -- if you only want these mappings for toggle term use term://*toggleterm#* instead
      vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'
      vim.cmd 'autocmd! BufEnter term://*toggleterm#* lua vim.cmd("startinsert")'
    end,
  },
}
