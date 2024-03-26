-- Search for selected text.
-- http://vim.wikia.com/wiki/VimTip171

-- See more: https://vim.fandom.com/wiki/Search_for_visually_selected_text

vim.g.VeryLiteral = false

local function getSelectedText()
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

function VSetSearch(prefix_key)
  local texts = getSelectedText()
  local pat = vim.fn.escape(table.concat(texts, '\n'), [[/\.*$^~[]])

  if vim.g.VeryLiteral then
    pat = vim.fn.substitute(pat, [[\n]], [[\\n]], 'g')
  else
    pat = vim.fn.substitute(pat, [[^\_s\+]], [[\\s\\+]], '')
    pat = vim.fn.substitute(pat, [[\_s\+$]], [[\\s\\*]], '')
    pat = vim.fn.substitute(pat, [[\_s\+]], [[\\_s\\+]], 'g')
  end

  vim.cmd(tostring(prefix_key) .. '\\V' .. pat)
end

function ToggleVeryLiteral()
  vim.g.VeryLiteral = not vim.g.VeryLiteral
  print('Setting VeryLiteral to: ' .. tostring(vim.g.VeryLiteral))
end

vim.keymap.set('v', '*', [[:lua VSetSearch('/')<CR>]], { buffer = true, desc = 'Selected search: Next' })
vim.keymap.set('v', '#', [[:lua VSetSearch('?')<CR>]], { buffer = true, desc = 'Selected search: Previous' })

vim.api.nvim_create_user_command('VeryLiteralToggle', [[lua ToggleVeryLiteral()]], {})

return {}
