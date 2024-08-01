return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VeryLazy', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup {
        triggers = {
          { '<auto>', mode = 'nixsotc' },

          -- Fix for nvim-surround
          { 'S', mode = { 'x', 'v' } },
          { 'c', mode = { 'n' } },
          { 'd', mode = { 'n' } },
          { 'y', mode = { 'n' } },
        },
      }

      -- Document existing key chains
      require('which-key').add {
        { '<leader>c', group = '[C]ode' },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk' },
      }
      -- Visual mode
      require('which-key').add {
        { '<leader>h', desc = 'Git [H]unk', mode = 'v' },
      }

      -- User Helper
      require('which-key').add {
        { '<leader>?', group = 'Keymap helper' },
        { '<leader>?m', ':map ', desc = 'Open MAP command prompt' },
        { '<leader>?!', ':Telescope keymaps<CR>', desc = 'Open keymap finder' },
        {
          '<leader>??',
          function()
            require('which-key').show { global = false }
          end,
          desc = 'Buffer Local Keymaps (which-key)',
        },
      }
    end,
  },
}
