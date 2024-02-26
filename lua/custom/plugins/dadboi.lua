return {
  {
    'kristijanhusak/vim-dadbod-ui',
    event = 'VeryLazy',
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    keys = {
      { '<leader>dtb', '<Cmd>:DBUIToggle<CR>', desc = 'Dadbod UI Toggle' },
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
    config = function()
      require('which-key').register {
        ['<leader>dt'] = { name = '[D]a[T]abase', _ = 'which_key_ignore' },
      }
    end,
  },
}
