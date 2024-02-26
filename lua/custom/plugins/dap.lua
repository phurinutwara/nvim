return {
  {
    'rcarriga/nvim-dap-ui',
    event = 'VeryLazy',
    dependencies = {
      'mfussenegger/nvim-dap',
    },
    keys = {
      { '<leader>dbt', ":lua require('dapui').toggle()<CR>", desc = 'DAP: Toggle UI' },
      { '<leader>dbb', ':DapToggleBreakpoint<CR>', desc = 'DAP: Toggle Breakpoint' },
      { '<leader>dbc', ':DapContinue<CR>', desc = 'DAP: Continue' },
      { '<leader>dbr', ":lua require('dapui').open({reset = true})<CR>", desc = 'DAP: Reset UI' },
    },
    config = function()
      require('which-key').register {
        ['<leader>db'] = { name = '[D]e[B]ugger', _ = 'which_key_ignore' },
      }
      require('neodev').setup {
        library = { plugins = { 'nvim-dap-ui' }, types = true },
      }
      require('dapui').setup()
      vim.fn.sign_define('DapBreakpoint', { text = '🔴', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })

      local dap = require 'dap'
      dap.adapters['pwa-node'] = {
        type = 'server',
        host = '127.0.0.1',
        port = 8123,
        executable = {
          command = 'js-debug-adapter',
        },
      }

      for _, language in ipairs { 'typescript', 'javascript' } do
        dap.configurations[language] = {
          {
            type = 'pwa-node',
            request = 'launch',
            name = 'Launch file',
            program = '${file}',
            cwd = '${workspaceFolder}',
            runtimeExecutable = 'node',
          },
        }
      end
    end,
  },
}
