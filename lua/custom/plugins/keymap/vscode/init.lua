local vscode
if vim.g.vscode then
  vscode = require 'vscode'
end

local M = {}

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- forward declaration
local git = require 'custom.plugins.keymap.vscode.git'
local fold = require 'custom.plugins.keymap.vscode.fold'

function M.init()
  -- better indent handling
  keymap('v', '<', '<gv', opts)
  keymap('v', '>', '>gv', opts)

  -- move text up and down
  keymap('v', 'J', ':m .+1<CR>==', opts)
  keymap('v', 'K', ':m .-2<CR>==', opts)
  keymap('x', 'J', ":move '>+1<CR>gv-gv", opts)
  keymap('x', 'K', ":move '<-2<CR>gv-gv", opts)

  -- actions without lose yank
  -- delete
  keymap('v', '<leader>d', [["_d]], opts)
  -- paste
  keymap('x', '<leader>p', [["_dP]], opts)
  keymap('v', '<leader>p', [["_dP]], opts)
  -- change
  keymap('v', '<leader>c', function()
    local mode = vim.fn.mode()
    print('mode is ' .. mode)
    if mode == 'v' then
      return '"_di' -- visual mode
    elseif mode == 'V' then
      return '_"_dO' -- visual line mode
    end
  end, { expr = true, remap = true })

  -- removes highlighting after escaping vim search
  keymap('n', '<Esc>', ':nohlsearch<CR>', opts)

  -- call vscode commands from neovim
  keymap({ 'n', 'x' }, '<leader>rn', function()
    vscode.action 'editor.action.rename'
  end, opts)

  -- general keymaps
  keymap({ 'n', 'v' }, '<leader>b', function()
    vscode.action 'workbench.action.toggleSidebarVisibility'
  end)
  keymap('n', '<leader>db', function()
    vscode.action 'editor.debug.action.toggleBreakpoint'
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
  keymap({ 'n', 'v' }, '<leader>f', function()
    vscode.action 'editor.action.formatDocument'
  end)
  keymap({ 'n', 'x' }, '<leader>rf', function()
    vscode.action 'editor.action.refactor'
  end, opts)
  keymap('n', '<leader>"', ':registers<CR>', opts)
  keymap('n', '<leader>X', '<cmd>!chmod +x %<CR>')
  keymap('n', '<leader>mm', function()
    vscode.action 'bookmarks.toggle'
  end, opts)
  keymap('n', '<leader>ml', function()
    vscode.action 'bookmarks.list'
  end, opts)
  keymap('n', '<leader>ma', function()
    vscode.action 'bookmarks.listFromAllFiles'
  end, opts)

  -- keymap({ 'n', 'v' }, '<leader>cp', function()
  --   vscode.action 'workbench.action.showCommands'
  -- end)
  -- keymap({ 'n', 'v' }, '<leader>d', function()
  --   vscode.action 'editor.action.showHover'
  -- end)
  -- keymap({ 'n', 'v' }, '<leader>pr', function()
  --   vscode.action 'code-runner.run'
  -- end)

  -- git stuffs
  git.init()

  -- folds
  -- see more https://github.com/vscode-neovim/vscode-neovim/issues/58
  fold.init()

  vim.schedule(function()
    print 'vscode keymap loaded'
  end)
end

if vim.g.vscode then
  return M
else
  return {}
end
