return {
  {
    'stevearc/conform.nvim',
    enabled = true,
    lazy = false,
    keys = {
      {

        '<leader>f',
        require('conform').format { async = true, lsp_fallback = true },
        desc = '[F]ormat buffer (conform)',
        mode = 'n',
      },
    },
    config = function()
      require('conform').setup {
        notify_on_error = true,
        format_on_save = function(bufnr)
          -- Disable "format_on_save lsp_fallback" for languages that don't
          -- have a well standardized coding style. You can add additional
          -- languages here or re-enable it for the disabled ones.
          local disable_filetypes = { c = true, cpp = true }
          if vim.g.format_is_enabled then
            vim.print 'auto formatted via conform'
            return {
              timeout_ms = 500,
              lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
            }
          else
            return
          end
        end,
        formatters_by_ft = {
          lua = { 'stylua' },
          javascript = { 'prettierd' },
          -- Conform can also run multiple formatters sequentially
          -- python = { "isort", "black" },
          --
          -- You can use a sub-list to tell conform to run *until* a formatter
          -- is found.
          -- javascript = { { "prettierd", "prettier" } },
        },
      }
    end,
  },
}
