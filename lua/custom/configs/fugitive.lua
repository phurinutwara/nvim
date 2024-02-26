-- Force close empty buffer tab after closing ':Git add --patch'
local local_group = vim.api.nvim_create_augroup('CustomFugitiveGroup', { clear = true })
vim.api.nvim_create_autocmd({ 'BufDelete' }, {
  pattern = { 'term*/git*' },
  callback = function(ev)
    vim.cmd 'tabclose | Git'
  end,
  group = local_group,
})

return {}
