return {
  {
    'ray-x/go.nvim',
    dependencies = { -- optional packages
      'ray-x/guihua.lua',
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      -- setup your go.nvim
      -- make sure lsp_cfg is disabled
      require('mason').setup()
      require('mason-lspconfig').setup()
      require('go').setup {
        lsp_cfg = false,
        -- other setups...
      }
      local cfg = require('go.lsp').config() -- config() return the go.nvim gopls setup

      require('lspconfig').gopls.setup(cfg)
    end,
    event = { 'CmdlineEnter' },
    ft = { 'go', 'gomod' },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
}
