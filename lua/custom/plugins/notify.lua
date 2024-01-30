return {
  'rcarriga/nvim-notify',
  enabled = false,
  event = 'VeryLazy',
  config = function()
    require('notify').setup {
      background_colour = '#000000',
      fps = 60,
      render = 'compact',
      timeout = 10000,
    }
  end,
  keys = {
    { '<leader>snd', require('notify').dismiss, desc = 'Notify: Clear Notifications' },
  },
}
