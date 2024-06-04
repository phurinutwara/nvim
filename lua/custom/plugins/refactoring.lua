return {
  {
    'ThePrimeagen/refactoring.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('refactoring').setup()

      -- load refactoring Telescope extension
      require('telescope').load_extension 'refactoring'
    end,
    keys = {
      -- EX COMMAND ------------------------------------------------------------
      {
        '<leader>re',
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
        '<leader>rv',
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
          require('telescope').extensions.refactoring.refactors()
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
