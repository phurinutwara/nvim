local vscode = require 'vscode'

if vim.g.vscode then
  vim.opt.clipboard = 'unnamedplus'
  vim.opt.inccommand = 'split'
  vim.opt.number = false
  vim.opt.relativenumber = false
  vim.opt.timeoutlen = 350
  vim.opt.undofile = true
  vim.opt.updatetime = 250
  vim.opt.hlsearch = true

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
    { import = 'custom.plugins.motion.nvim-surround' },
    { import = 'custom.plugins.motion.swap' },
  }

  vscode.notify 'vscode-neovim initialized'
end
