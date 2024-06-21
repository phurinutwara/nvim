return {
  {
    'nvimtools/none-ls.nvim',
    event = 'VeryLazy',
    dependencies = {
      'williamboman/mason.nvim',
      'nvim-lua/plenary.nvim',
    },
    config = function()
      local registry = require 'mason-registry'

      local ensure_installed = {
        'buf',
        'js-debug-adapter',
        'prettierd',
        'stylua',
        'tailwindcss-language-server',
      }

      for _, item in ipairs(ensure_installed) do
        local result = registry.is_installed(item)
        if not result then
          vim.cmd('MasonInstall ' .. item)
        end
      end

      local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
      local null_ls = require 'null-ls'

      null_ls.setup {
        debug = true,
        sources = {
          null_ls.builtins.diagnostics.buf,
          null_ls.builtins.formatting.buf,
          null_ls.builtins.formatting.prettierd,
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.black,
        },
        on_attach = function(client, bufnr)
          if client.supports_method 'textDocument/formatting' then
            vim.api.nvim_clear_autocmds {
              group = augroup,
              buffer = bufnr,
            }
          end
        end,
      }
    end,
  },
}
