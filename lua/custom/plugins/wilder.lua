return {
  {
    'gelguy/wilder.nvim',
    dependencies = {
      'roxma/vim-hug-neovim-rpc',
      { 'roxma/nvim-yarp', build = 'python3 -m pip install pynvim' },
    },
    config = function()
      require('wilder').setup {
        modes = { ':', '/', '?' },
      }
      -- NOTE: Don't forget to run :UpdateRemotePlugins
    end,
  },
}
