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
        'eslint_d',
        'js-debug-adapter',
        'prettierd',
        'stylua',
        'tailwindcss-language-server',
        'black',
      }

      for _, item in ipairs(ensure_installed) do
        local result = registry.is_installed(item)
        if not result then
          vim.cmd('MasonInstall ' .. item)
        end
      end

      local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
      local null_ls = require 'null-ls'

      local format_is_enabled = true
      vim.api.nvim_create_user_command('AutoFormatToggle', function()
        format_is_enabled = not format_is_enabled
        print('Setting autoformatting to: ' .. tostring(format_is_enabled))
      end, {})

      null_ls.setup {
        debug = true,
        sources = {
          null_ls.builtins.diagnostics.buf,
          null_ls.builtins.diagnostics.eslint_d,
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
            vim.api.nvim_create_autocmd('BufWritePre', {
              group = augroup,
              buffer = bufnr,
              callback = function()
                if not format_is_enabled then
                  return
                end
                vim.lsp.buf.format { async = false }
              end,
            })
          end
        end,
      }
    end,
  },
}
