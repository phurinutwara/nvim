return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      local lualine = require 'lualine'
      local catpuccin = require 'catppuccin.utils.lualine'()

      -- Config
      local config = {
        options = {
          disabled_filetypes = { 'NvimTree' },
          -- Disable sections and component separators
          theme = catpuccin,
          component_separators = '|',
          section_separators = {
            left = '',
            right = '',
          },
          ignore_focus = {
            'dapui_watches',
            'dapui_breakpoints',
            'dapui_scopes',
            'dapui_console',
            'dapui_stacks',
            'dap-repl',
          },
        },
      }

      lualine.setup(config)
    end,
  },
}
