local go = require 'custom.plugins.refactoring.languages.go'
local javascript = require 'custom.plugins.refactoring.languages.javascript'

local get_print_var_statements_by_mode = function(mode)
  if mode ~= 'simple' and mode ~= 'verbose' then
    mode = 'simple'
  end

  return {
    print_var_statements = {
      go = { go.statements[mode] },
      javascript = { javascript.statements[mode] },
    },
  }
end

return {
  {
    'ThePrimeagen/refactoring.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('refactoring').setup {
        prompt_func_return_type = {
          go = true,
          java = false,

          cpp = false,
          c = false,
          h = false,
          hpp = false,
          cxx = false,
        },
        prompt_func_param_type = {
          go = true,
          java = false,

          cpp = false,
          c = false,
          h = false,
          hpp = false,
          cxx = false,
        },
        printf_statements = {},
        print_var_statements = {
          -- example: https://github.com/ThePrimeagen/refactoring.nvim/tree/master/lua/refactoring/tests/debug/print_var
          go = { go.statements.simple },
          javascript = { javascript.statements.simple },
        },
        show_success_message = true, -- shows a message with information about the refactor on success
        -- i.e. [Refactor] Inlined 3 variable occurrences
      }
    end,
    keys = {
      -- EX COMMAND ------------------------------------------------------------
      {
        '<leader>rE',
        function()
          require('refactoring').refactor 'Extract Function'
        end,
        mode = 'x',
        desc = 'Refactoring: Extract Funtion',
        -- Extract function supports only visual mode
      },
      {
        '<leader>rf',
        function()
          require('refactoring').refactor 'Extract Function To File'
        end,
        mode = 'x',
        desc = 'Refactoring: Extract Funtion To File',
        -- Extract function supports only visual mode
      },
      {
        '<leader>re',
        function()
          require('refactoring').refactor 'Extract Variable'
        end,
        mode = 'x',
        desc = 'Refactoring: Extract Variable',
        -- Extract variable supports only visual mode
      },
      {
        '<leader>rI',
        function()
          require('refactoring').refactor 'Inline Function'
        end,
        mode = 'n',
        desc = 'Refactoring: Inline Function',
        -- Inline func supports only normal
      },
      {
        '<leader>ri',
        function()
          require('refactoring').refactor 'Inline Variable'
        end,
        mode = { 'n', 'x' },
        desc = 'Refactoring: Inline Variable',
        -- Inline var supports both normal and visual mode
      },
      {
        '<leader>rb',
        function()
          require('refactoring').refactor 'Extract Block'
        end,
        mode = 'n',
        desc = 'Refactoring: Extract Block',
        -- Extract block supports only normal mode
      },
      {
        '<leader>rbf',
        function()
          require('refactoring').refactor 'Extract Block To File'
        end,
        mode = 'n',
        desc = 'Refactoring: Extract Block To File',
        -- Extract block supports only normal mode
      },
      {
        '<leader>rr',
        function()
          require('refactoring').select_refactor()
        end,
        mode = { 'n', 'x' },
        desc = 'Refactoring: Refactoring with Telescope',
        -- Refactoring supports both normal and visual mode
      },
      -- EX COMMAND ------------------------------------------------------------

      -- DEBUG OPERATIONS ------------------------------------------------------
      {
        '<leader>rp',
        function()
          require('refactoring').debug.printf { below = false }
        end,
        mode = 'n',
        desc = 'Refactoring: Debug printf',
      },
      {
        '<leader>rv',
        function()
          require('refactoring').debug.print_var()
        end,
        mode = { 'n', 'x' },
        desc = 'Refactoring: Debug print_var',
      },
      {
        '<leader>rV',
        function()
          require('refactoring').debug.print_var(get_print_var_statements_by_mode 'verbose')
        end,
        mode = { 'n', 'x' },
        desc = 'Refactoring: Debug print_var (verbose)',
      },
      {
        '<leader>rc',
        function()
          require('refactoring').debug.cleanup {}
        end,
        mode = 'n',
        desc = 'Refactoring: Debug clean up',
      },
      -- DEBUG OPERATIONS ------------------------------------------------------
    },
  },
}
