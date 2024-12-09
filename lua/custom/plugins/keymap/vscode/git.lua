local vscode
if vim.g.vscode then
  vscode = require 'vscode'
end

local M = {}

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

function M.init()
  keymap('n', '<leader>hp', function()
    vscode.action 'gitlens.toggleFileChanges'
  end, opts)
  keymap({ 'n', 'v', 'x' }, '<leader>hs', function()
    vscode.call 'git.stageSelectedRanges'
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<esc>', true, false, true), 'x', true)
  end, opts)
  keymap({ 'n', 'v', 'x' }, '<leader>hr', function()
    vscode.call 'git.revertSelectedRanges'
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<esc>', true, false, true), 'x', true)
  end, opts)
  keymap('n', ']c', function()
    vscode.action 'workbench.action.editor.nextChange'
    vscode.action 'workbench.action.compareEditor.nextChange'
  end, opts)
  keymap('n', '[c', function()
    vscode.action 'workbench.action.editor.previousChange'
    vscode.action 'workbench.action.compareEditor.previousChange'
  end, opts)
end

return M
