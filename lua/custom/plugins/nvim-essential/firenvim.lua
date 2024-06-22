return {
  {
    'glacambre/firenvim',

    -- Lazy load firenvim
    -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
    lazy = not vim.g.started_by_firenvim,
    build = function()
      vim.fn['firenvim#install'](0)
    end,
    config = function()
      -- make plugin detect sate with vim:set
      if vim.g.started_by_firenvim == true then
        vim.o.laststatus = 0
      else
        vim.o.laststatus = 2
      end

      -- firenvim config
      vim.g.firenvim_config = {
        globalSettings = {
          alt = 'all',
          ['<C-w>'] = 'noop',
          ['<C-n>'] = 'default',
        },
        localSettings = {
          ['.*'] = {
            cmdline = 'neovim',
            content = 'text',
            priority = 0,
            selector = 'textarea',
            takeover = 'never', -- later use <C-e> or <⌘-e> to takeover
          },
          -- ['https?://.*google[^/]+'] = {
          --   takeover = 'never',
          --   priority = 1,
          -- },
        },
      }

      -- auto-save on text changed after timeout (ms): https://github.com/glacambre/firenvim#automatically-syncing-changes-to-the-page
      local TIMEOUT = 500
      local timer = vim.uv.new_timer() -- See more vim.uv: https://neovim.io/doc/user/lua.html#vim.uv
      vim.api.nvim_create_autocmd({ 'TextChanged', 'TextChangedI' }, {
        callback = function(e)
          timer:start(
            TIMEOUT,
            0,
            vim.schedule_wrap(function()
              vim.cmd [[write]]
              timer = vim.uv.new_timer()
            end)
          )
        end,
      })

      -- set font for firenvim instance: https://github.com/glacambre/firenvim/issues/110#issuecomment-550137400
      vim.api.nvim_create_autocmd({ 'UIEnter' }, {
        callback = function(e)
          vim.notify('nvim instance stated with firenvim', vim.log.levels.INFO)
          vim.cmd [[set guifont=JetBrainsMono\ Nerd\ Font\ Mono:h10]] -- https://forums.freebsd.org/threads/vim-set-guifont.79219/
          vim.g.format_is_enabled = false
          vim.g.go_fmt_autosave = 0
        end,
      })
    end,
  },
}
