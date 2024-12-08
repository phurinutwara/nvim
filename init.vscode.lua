local vscode = require 'vscode'

-- =========================== .:entrance for VSCode Neovim:. ===========================
-- see more https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim
-- ======================================================================================

if vim.g.vscode then
  vim.opt.inccommand = 'split'
  vim.opt.number = false
  vim.opt.relativenumber = false
  vim.opt.timeoutlen = 350
  vim.opt.undofile = true
  vim.opt.updatetime = 250
  vim.opt.hlsearch = true

  -- sync clipboard between OS and Neovim.
  --  schedule the setting after `UiEnter` because it can increase startup-time.
  --  remove this option if you want your OS clipboard to remain independent.
  vim.schedule(function()
    vim.opt.clipboard = 'unnamedplus'
  end)

  -- load keymap for vscode-neovim instance
  require 'lua.custom.plugins.keymap.vscode'

  -- install `lazy.nvim` plugin manager
  -- see `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
  local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
  if not vim.uv.fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
    if vim.v.shell_error ~= 0 then
      error('Error cloning lazy.nvim:\n' .. out)
    end
  end ---@diagnostic disable-next-line: undefined-field
  vim.opt.rtp:prepend(lazypath)

  require('lazy').setup {
    'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
    { 'numToStr/Comment.nvim', opts = {} }, -- "gc" to comment visual regions/lines
    { import = 'custom.plugins.motion.nvim-surround' },
    { import = 'custom.plugins.motion.swap' },
  }

  vim.schedule(function()
    local msg = 'vscode-neovim initialized'
    vscode.notify(msg)
    print(msg)
  end)
end
