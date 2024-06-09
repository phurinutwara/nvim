return {
  {
    'mistricky/codesnap.nvim',
    build = 'make build_generator',
    keys = {
      { '<leader>cc', '<cmd>CodeSnap<cr>', mode = 'x', desc = 'Save selected code snapshot into clipboard' },
      { '<leader>cs', '<cmd>CodeSnapSave<cr>', mode = 'x', desc = 'Save selected code snapshot in ~/Pictures' },
    },
    opts = {
      save_path = '~/Pictures',

      has_breadcrumbs = true,
      has_line_number = false,
      mac_window_bar = true,

      breadcrumbs_separator = '/',
      title = 'CodeSnap.nvim',
      code_font_family = 'CaskaydiaCove Nerd Font',
      watermark = '',
      watermark_font_family = 'Pacifico',
      bg_color = '#535c68',

      min_width = 0,
    },
  },
}
