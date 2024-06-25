return {
  {
    'ntpeters/vim-better-whitespace',
    event = 'VeryLazy',
    name = 'better-whitespace',
    config = function()
      -- local colors = require('catppuccin.palettes').get_palette 'mocha'
      -- vim.api.nvim_set_hl(0, 'ExtraWhitespace', { bg = colors.red })
      local augroup = vim.api.nvim_create_augroup('VimBetterWhitespace', { clear = true })
      vim.api.nvim_create_autocmd({ 'FileType' }, {
        desc = 'Auto enable vim-better-whitespace',
        group = augroup,
        pattern = '*.*',
        command = 'EnableWhitespace',
      })
    end,
  },
}
