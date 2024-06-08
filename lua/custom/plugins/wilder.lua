return {
  {
    'gelguy/wilder.nvim',
    dependencies = {
      { 'roxma/vim-hug-neovim-rpc' },
      {
        'roxma/nvim-yarp',
        build = 'cat requirements.txt | xargs python3 -m pip install ',
      },
    },
    config = function()
      require('wilder').setup {
        modes = { ':', '/', '?' },
      }
      -- NOTE: Don't forget to run :UpdateRemotePlugins
    end,
  },
}
