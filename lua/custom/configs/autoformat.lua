-- Global variable configuration
vim.g.format_is_enabled = false

-- Usable user command
vim.api.nvim_create_user_command('AutoFormatToggle', function()
  vim.g.format_is_enabled = not vim.g.format_is_enabled
  print('Setting autoformatting to: ' .. tostring(vim.g.format_is_enabled))
end, {})

return {}
