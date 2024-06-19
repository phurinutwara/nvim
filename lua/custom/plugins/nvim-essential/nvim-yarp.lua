return {
  'roxma/nvim-yarp',
  build = {
    'python3 -m venv ~/.venvs/nvim && source ~/.venvs/nvim/bin/activate && pip3 install pynvim',
  },
}
