return {
  {
    'clipboard.lua',
    dev = true,
    dependencies = {
      'rcarriga/nvim-notify',
    },
    config = function()
      local TMUX = os.getenv 'TMUX'
      local OSTYPE = (vim.api.nvim_exec2([[silent !uname --kernel-release]], { output = true }))

      local function no_paste(reg)
        return function(lines)
          vim.notify_once('disable paste from OSC52, using " register!', vim.log.levels.WARN)
        end
      end

      if TMUX == nil and string.match(OSTYPE.output, '(WSL)') == 'WSL' then
        vim.notify_once('use osc52 as clipboard provider', vim.log.levels.INFO)
        vim.g.clipboard = {
          name = 'OSC 52',
          copy = {
            ['+'] = require('vim.ui.clipboard.osc52').copy '+',
            ['*'] = require('vim.ui.clipboard.osc52').copy '*',
          },
          paste = {
            ['+'] = no_paste '+', -- Pasting disabled
            ['*'] = no_paste '*', -- Pasting disabled

            -- ['+'] = require('vim.ui.clipboard.osc52').paste '+', -- TODO: write wezterm.lua script to return clipboard when nvim request
            -- ['*'] = require('vim.ui.clipboard.osc52').paste '*', -- TODO: write wezterm.lua script to return clipboard when nvim request
          },
        }
      end
    end,
  },
}
