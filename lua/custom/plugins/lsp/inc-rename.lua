return {
  {
    'smjonas/inc-rename.nvim',
    config = function()
      require('inc_rename').setup {}
      vim.keymap.set('n', '<leader>rN', [[:IncRename <C-r><C-w>]], { desc = 'LSP: Increment [R]e[n]ame' })
      vim.keymap.set('n', '<leader>rn', ':IncRename ', { desc = 'LSP: Increment [R]e[n]ame' })
    end,
  },
}
