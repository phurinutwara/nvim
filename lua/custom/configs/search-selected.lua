--------------------------------------------------------------------------------

-- Forward declarations
local getSelectedText, escapeText

-- Global function
function VSetSearch(prefix_key)
  local selected_text = getSelectedText()
  local escaped_text = escapeText(selected_text, { very_literal = vim.g.VeryLiteral })
  vim.cmd(tostring(prefix_key) .. '\\V' .. escaped_text)
end

function ToggleVeryLiteral()
  vim.g.VeryLiteral = not vim.g.VeryLiteral
  vim.notify('Setting VeryLiteral to: ' .. tostring(vim.g.VeryLiteral), vim.log.levels.INFO)
end

function CopySelectingText(opt)
  setmetatable(opt, { register = '' })
  local selected_text = getSelectedText()
  local escaped_text = escapeText(selected_text, { very_literal = vim.g.VeryLiteral })
  vim.fn.setreg(opt.register, escaped_text)
end

-- Helper function
function getSelectedText()
  local start_tbl = vim.fn.getpos "'<"
  local start_row = start_tbl[2] - 1
  local start_col = start_tbl[3] - 1

  local end_tbl = vim.fn.getpos "'>"
  local end_row = end_tbl[2] - 1
  local end_col = end_tbl[3]

  local end_line = vim.api.nvim_buf_get_lines(0, end_row, end_row + 1, false)
  local max_end_length = vim.fn.strlen(end_line[1])

  if end_col > max_end_length then
    end_col = max_end_length
  end

  local selected_text = vim.api.nvim_buf_get_text(0, start_row, start_col, end_row, end_col, {})
  return selected_text
end

function escapeText(selected_text, opt)
  local pat = vim.fn.escape(table.concat(selected_text, '\n'), [[/\.*$^~[]])

  setmetatable(opt, { very_literal = false })
  if opt.very_literal then
    pat = vim.fn.substitute(pat, [[\n]], [[\\n]], 'g')
  else
    pat = vim.fn.substitute(pat, [[^\_s\+]], [[\\s\\+]], '')
    pat = vim.fn.substitute(pat, [[\_s\+$]], [[\\s\\*]], '')
    pat = vim.fn.substitute(pat, [[\_s\+]], [[\\_s\\+]], 'g')
  end
  return pat
end

-- Example of very literal
--
--[[
Hello
World!.

Hello World!.
--]]
--
-- -> VeryLiteral: true, More exact indent position
--    \VHello\nWorld!\.
--
-- -> VeryLiteral: false, More flexible indent position
--    \VHello\_s\+World!\.

-- Search for selected text.
-- http://vim.wikia.com/wiki/VimTip171
--
-- See more: https://vim.fandom.com/wiki/Search_for_visually_selected_text

local function main()
  -- Global variable configuration
  vim.g.VeryLiteral = false

  -- Key mapping
  require('which-key').add {
    mode = 'v',
    { '*', [[:lua VSetSearch('/')<CR>]], desc = 'Selected search: Next' },
    { '#', [[:lua VSetSearch('?')<CR>]], desc = 'Selected search: Previous' },
    { '<leader>e', group = '[E]scape' },
    { '<leader>ey', [[:lua CopySelectingText({register='*'})<CR>]], desc = '[E]scape selecting text to Yank register' },
  }

  -- Usable user command
  vim.api.nvim_create_user_command('VeryLiteralToggle', [[lua ToggleVeryLiteral()]], {})
end
main()

return {}
