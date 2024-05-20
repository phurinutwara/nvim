return {
  {
    'fatih/vim-go',
    dependencies = {
      'neovim/nvim-lspconfig',
    },
    ft = { 'go', 'gomod', 'gosum' },
    config = function()
      local lspconfig = require 'lspconfig'
      vim.lsp.inlay_hint.enable(true)

      lspconfig.gopls.setup {
        settings = {
          gopls = {
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
          },
        },
      }
    end,
  },
}
