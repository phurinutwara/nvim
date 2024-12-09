local vscode
if vim.g.vscode then
  vscode = require 'vscode'
end

local _moveCursor
local M = {}

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

function M.init()
  keymap('n', 'zM', function()
    vscode.action 'editor.foldAll'
  end, opts)
  keymap('n', 'zR', function()
    vscode.action 'editor.unfoldAll'
  end, opts)
  keymap('n', 'zc', function()
    vscode.action 'editor.fold'
  end, opts)
  keymap('n', 'zC', function()
    vscode.action 'editor.foldRecursively'
  end, opts)
  keymap('n', 'zo', function()
    vscode.action 'editor.unfold'
  end, opts)
  keymap('n', 'zO', function()
    vscode.action 'editor.unfoldRecursively'
  end, opts)
  keymap('n', 'za', function()
    vscode.action 'editor.toggleFold'
  end, opts)

  -- fix vertical movements break folding
  keymap('n', 'k', function()
    return _moveCursor 'k'
  end, { expr = true, remap = true })
  keymap('n', 'j', function()
    return _moveCursor 'j'
  end, { expr = true, remap = true })
  return true
end

function _moveCursor(direction)
  if vim.fn.reg_recording() == '' and vim.fn.reg_executing() == '' then
    return 'g' .. direction
  else
    return direction
  end
end

return M
