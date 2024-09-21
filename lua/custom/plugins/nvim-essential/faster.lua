-- To find which plugins made nvim laggy
--
-- See https://thoughtbot.com/blog/profiling-vim
-- See more
-- :help profile
-- :help syntime
-- :help scriptnames

return {
  'pteroctopus/faster.nvim',
  config = function()
    require('faster').setup()
  end,
}
