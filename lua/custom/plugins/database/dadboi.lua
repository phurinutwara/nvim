return {
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod' },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' } },
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
      vim.g.db_ui_execute_on_save = 0
      vim.g.db_ui_auto_execute_table_helpers = 0 -- WARN: be careful to adjust this
    end,
    config = function()
      require('which-key').add {
        { '<leader>dt', group = '[D]a[T]abase' },
      }
      local augroup = vim.api.nvim_create_augroup('Dadboi', { clear = false })
      vim.api.nvim_create_autocmd({ 'FileType' }, {
        desc = 'Add completion to *.sql *.mysql *.plsql',
        group = augroup,
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
