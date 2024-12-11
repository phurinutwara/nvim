local vscode = require 'vscode'
local vscodeKeymap = require 'custom.plugins.keymap.vscode'

-- =========================== .:entrance for VSCode Neovim:. ===========================
-- see more https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim
-- ======================================================================================

local lazy
local function main()
  if vim.g.vscode then
    vim.opt.inccommand = 'split'
    vim.opt.number = false
    vim.opt.relativenumber = false
    vim.opt.undofile = true
    vim.opt.updatetime = 250
    vim.opt.hlsearch = true
    vim.opt.wrap = false
    -- vim.opt.timeoutlen = 420

    -- indent setting
    vim.opt.shiftwidth = 2
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.expandtab = true

    -- remap leader key
    vim.keymap.set('n', '<Space>', '', { noremap = true, silent = true })
    vim.g.mapleader = ' '
    vim.g.maplocalleader = ' '

    -- sync clipboard between OS and Neovim.
    --  schedule the setting after `UiEnter` because it can increase startup-time.
    --  remove this option if you want your OS clipboard to remain independent.
    vim.schedule(function()
      vim.opt.clipboard = 'unnamedplus'
    end)

    -- initial lazy
    lazy.init {
      'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
      { 'numToStr/Comment.nvim', opts = {} }, -- "gc" to comment visual regions/lines
      { import = 'custom.plugins.motion.nvim-surround' },
      { import = 'custom.plugins.motion.mini' },
      { import = 'custom.plugins.motion.swap' },
    }

    -- load keymap for vscode-neovim instance
    vscodeKeymap.init()

    vim.schedule(function()
      local msg = 'vscode-neovim initialized'
      vscode.notify(msg)
      print(msg)
    end)
  end
end

lazy = {
  init = function(packages)
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

    require('lazy').setup(packages)
  end,
}

main()
