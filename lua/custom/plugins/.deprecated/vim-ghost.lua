return {
  'raghur/vim-ghost',
  enabled = false,
  dependencies = {
    'roxma/nvim-yarp',
  },
  build = [[:GhostInstall]],
  config = function()
    -- NOTE: Don't forget to :GhostInstall
  end,
}
