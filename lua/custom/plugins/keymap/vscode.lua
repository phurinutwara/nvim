local vscode = require 'vscode'

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

if vim.g.vscode then
  -- remap leader key
  keymap('n', '<Space>', '', opts)
  vim.g.mapleader = ' '
  vim.g.maplocalleader = ' '

  -- yank to system clipboard
  keymap({ 'n', 'v' }, '<leader>y', '"+y', opts)

  -- paste from system clipboard
  keymap({ 'n', 'v' }, '<leader>p', '"+p', opts)

  -- better indent handling
  keymap('v', '<', '<gv', opts)
  keymap('v', '>', '>gv', opts)

  -- move text up and down
  keymap('v', 'J', ':m .+1<CR>==', opts)
  keymap('v', 'K', ':m .-2<CR>==', opts)
  keymap('x', 'J', ":move '>+1<CR>gv-gv", opts)
  keymap('x', 'K', ":move '<-2<CR>gv-gv", opts)

  -- paste preserves primal yanked piece
  keymap('v', 'p', '"_dP', opts)
  keymap({ 'n', 'v' }, '<leader>d', [["_d"]], opts)

  -- removes highlighting after escaping vim search
  keymap('n', '<Esc>', '<cmd>nohlsearch<CR>', opts)

  -- call vscode commands from neovim
  keymap({ 'n', 'x' }, '<leader>r', function()
    vscode.with_insert(function()
      vscode.action 'editor.action.refactor'
    end)
  end)

  -- general keymaps
  keymap({ 'n', 'v' }, '<leader>b', function()
    vscode.action 'workbench.action.toggleSidebarVisibility'
  end)
  keymap({ 'n', 'v' }, '<leader>db', function()
    vscode.action 'editor.debug.action.toggleBreakpoint'
  end)
  keymap({ 'n', 'v' }, '<leader>d', function()
    vscode.action 'editor.action.showHover'
  end)
  keymap({ 'n', 'v' }, '<leader>a', function()
    vscode.action 'editor.action.quickFix'
  end)
  keymap({ 'n', 'v' }, '<leader>sp', function()
    vscode.action 'workbench.actions.view.problems'
  end)
  keymap({ 'n', 'v' }, '<leader>snd', function()
    vscode.action 'notifications.clearAll'
  end)
  keymap({ 'n', 'v' }, '<leader>ff', function()
    vscode.action 'workbench.action.quickOpen'
  end)
  keymap({ 'n', 'v' }, '<leader>cp', function()
    vscode.action 'workbench.action.showCommands'
  end)
  keymap({ 'n', 'v' }, '<leader>pr', function()
    vscode.action 'code-runner.run'
  end)
  keymap({ 'n', 'v' }, '<leader>f', function()
    vscode.action 'editor.action.formatDocument'
  end)
  keymap({ 'n', 'x' }, '<leader>re', function()
    vscode.action 'editor.action.refactor'
  end, opts)

  print 'vscode keymap loaded'
end

return {}
