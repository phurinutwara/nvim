return {
  {
    'm4xshen/smartcolumn.nvim',
    config = function()
      require('smartcolumn').setup {
        disabled_filetypes = { 'NvimTree', 'lazy', 'mason', 'help', 'checkhealth', 'lspinfo', 'noice', 'Trouble', 'fish', 'zsh' },

        colorcolumn = { '120' },
        custom_colorcolumn = {
          lua = '160',
        },
      }
    end,
  },
}
