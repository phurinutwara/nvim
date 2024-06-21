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

      -- auto-save on text changed after (1.5s timeout)
      vim.api.nvim_create_autocmd({ 'TextChanged', 'TextChangedI' }, {
        callback = function(e)
          if vim.g.timer_started == true then
            return
          end
          vim.g.timer_started = true
          vim.fn.timer_start(1500, function()
            vim.g.timer_started = false
            vim.cmd [[write]]
          end)
        end,
      })

      -- set font for firenvim instance: https://github.com/glacambre/firenvim/issues/110
      vim.api.nvim_create_autocmd({ 'UIEnter' }, {
        callback = function(e)
          vim.notify('nvim instance stated with firenvim', vim.log.levels.INFO)
          vim.cmd [[set guifont=JetBrainsMono\ Nerd\ Font\ Mono:h10]] -- https://github.com/glacambre/firenvim/issues/110#issuecomment-550137400
          vim.g.format_is_enabled = false
          vim.g.go_fmt_autosave = 0
        end,
      })
    end,
  },
}