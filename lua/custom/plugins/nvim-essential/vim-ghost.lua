return {
  'raghur/vim-ghost',
  dependencies = {
    'roxma/nvim-yarp',
  },
  build = [[:GhostInstall]],
  config = function()
    -- NOTE: Don't forget to :GhostInstall
  end,
}
