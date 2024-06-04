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
      vim.api.nvim_create_autocmd({ 'FileType' }, {
        pattern = { 'sql', 'mysql', 'plsql' },
        callback = function()
          require('cmp').setup.buffer {
            sources = {
              { name = 'vim-dadbod-completion' },
            },
            formatting = {
              format = function(entry, item)
                local menu_icon = {
                  ['vim-dadbod-completion'] = '󰆼',
                }

                item.menu = menu_icon[entry.source.name]
                return item
              end,
            },
          }
        end,
      })
    end,
  },
}
