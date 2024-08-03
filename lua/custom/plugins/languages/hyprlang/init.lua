vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = { '*.hl', 'hypr*.conf' },
  callback = function(event)
    vim.opt.filetype = 'hyprlang'
    require('lspconfig')['hyprls'].setup { hyprls = {} }
  end,
})

return {}
