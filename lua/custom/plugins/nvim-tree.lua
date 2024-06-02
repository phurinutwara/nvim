return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  requires = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- set termguicolors to enable highlight groups
    vim.opt.termguicolors = true

    -- Smart nvim-tree toggling
    -- See more: https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes#smart-nvim-tree-toggling
    local nvimTreeFocusOrToggle = function()
      local nvimTree = require 'nvim-tree.api'
      local currentBuf = vim.api.nvim_get_current_buf()
      local currentBufFt = vim.api.nvim_get_option_value('filetype', { buf = currentBuf })
      if currentBufFt == 'NvimTree' then
        nvimTree.tree.toggle()
      else
        nvimTree.tree.focus()
      end
    end
    vim.keymap.set('n', '<leader>b', nvimTreeFocusOrToggle, { desc = 'Toggle sidebar' })

    -- toggle the width and redraw
    -- See more: https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes#toggle-adaptive-width
    local VIEW_WIDTH_FIXED = 30
    local view_width_max = VIEW_WIDTH_FIXED -- fixed to start
    local function toggle_width_adaptive()
      if view_width_max == -1 then
        view_width_max = VIEW_WIDTH_FIXED
      else
        view_width_max = -1
      end
      print('Setting width adaptive to: ' .. tostring(view_width_max == -1 and true or false))
      require('nvim-tree.api').tree.reload()
    end
    -- get current view width
    local function get_view_width_max()
      return view_width_max
    end
    vim.keymap.set('n', '<C-b>', toggle_width_adaptive, { desc = 'Toggle Adaptive Width' })

    require('nvim-tree').setup {
      disable_netrw = true,
      update_focused_file = {
        enable = true,
      },
      filters = {
        git_ignored = false,
      },
      view = {
        width = {
          min = 30,
          max = get_view_width_max,
        },
        preserve_window_proportions = true,
      },
      actions = {
        open_file = {
          resize_window = false,
        },
      },
    }
  end,
}
