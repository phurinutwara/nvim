return {
  {
    'gelguy/wilder.nvim',
    dependencies = {
      'roxma/vim-hug-neovim-rpc',
      'roxma/nvim-yarp',
      'kyazdani42/nvim-web-devicons',
      'romgrk/fzy-lua-native',
    },
    event = 'CmdlineEnter',
    config = function()
      local wilder = require 'wilder'
      wilder.setup { modes = { ':', '/', '?' } }

      -- Disable Python remote plugin
      wilder.set_option('use_python_remote_plugin', 0)

      wilder.set_option('pipeline', {
        wilder.branch(
          wilder.cmdline_pipeline {
            fuzzy = 1,
            fuzzy_filter = wilder.lua_fzy_filter(),
          },
          wilder.vim_search_pipeline()
        ),
      })

      wilder.set_option(
        'renderer',
        wilder.renderer_mux {
          [':'] = wilder.popupmenu_renderer {
            highlighter = wilder.lua_fzy_highlighter(),
            highlights = {
              accent = wilder.make_hl('WilderAccent', 'Pmenu', { { a = 1 }, { a = 1 }, { foreground = '#e78285' } }),
            },
            left = { ' ', wilder.popupmenu_devicons() },
            right = { ' ', wilder.popupmenu_scrollbar() },
            pumblend = 20,
          },
          ['/'] = wilder.wildmenu_renderer {
            highlighter = wilder.lua_fzy_highlighter(),
            pumblend = 20,
          },
        }
      )
      -- NOTE: Don't forget to run :UpdateRemotePlugins
    end,
  },
}
