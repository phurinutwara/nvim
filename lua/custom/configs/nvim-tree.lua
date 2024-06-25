return {
  'nvim-tree-config.lua',
  dev = true,
  config = function()
    -- Dynamically resize NvimTree
    local PERCENTAGE = 20

    vim.api.nvim_create_autocmd({ 'VimResized' }, {
      desc = 'Resize nvim-tree if nvim window got resized',
      group = vim.api.nvim_create_augroup('NvimTreeResize', { clear = true }),
      callback = function()
        local ratio = PERCENTAGE / 100
        local width = math.floor(vim.go.columns * ratio)
        vim.cmd('tabdo NvimTreeResize ' .. width)
      end,
    })
  end,
}
