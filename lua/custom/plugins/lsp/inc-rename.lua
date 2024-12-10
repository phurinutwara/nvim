return {
  {
    'smjonas/inc-rename.nvim',
    config = function()
      require('inc_rename').setup {}
      vim.keymap.set('n', '<leader>rn', [[:IncRename <C-r><C-w>]], { desc = 'LSP: Increment [R]e[n]ame' })
      vim.keymap.set('n', '<leader>rN', ':IncRename ', { desc = 'LSP: Increment hard [R]e[n]ame' })
      -- we use frequently usage on lowercase
      -- and put seldomly on uppercase
    end,
  },
}
