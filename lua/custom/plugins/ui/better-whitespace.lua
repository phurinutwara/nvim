return {
  {
    'ntpeters/vim-better-whitespace',
    event = 'VeryLazy',
    name = 'better-whitespace',
    config = function()
      -- local colors = require('catppuccin.palettes').get_palette 'mocha'
      -- vim.api.nvim_set_hl(0, 'ExtraWhitespace', { bg = colors.red })
      vim.api.nvim_create_autocmd({ 'FileType' }, {
        pattern = '*.*',
        command = 'EnableWhitespace',
      })
    end,
  },
}
