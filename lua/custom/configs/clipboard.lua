return {
  {
    'clipboard.lua',
    dev = true,
    dependencies = {
      'rcarriga/nvim-notify',
    },
    config = function()
      local OSTYPE = (vim.api.nvim_exec2([[silent !uname --kernel-release]], { output = true }))

      if string.match(OSTYPE.output, '(WSL)') == 'WSL' then
        vim.notify_once('use wsl as clipboard provider (:h clipboard-wsl)', vim.log.levels.INFO)
        vim.cmd [[
          let g:clipboard = {
          \   'name': 'WslClipboard',
          \   'copy': {
          \      '+': '/mnt/c/WINDOWS/system32/clip.exe',
          \    },
          \   'paste': {
          \      '+': '/mnt/c/WINDOWS/System32/WindowsPowerShell/v1.0//powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
          \   },
          \   'cache_enabled': 0,
          \ }
        ]]

        -- TODO: FIX SLOW PERFORMANCE USING /mnt/c on paste (copy is fine) by this:
        --       https://stackoverflow.com/a/76314967/15029223
        --
        -- NOTE: use `time [cmd] ` to meature the time, now it's 0.3s delay
        --       0.00user 0.00system 0:00.31elapsed 0%CPU (0avgtext+0avgdata 1876maxresident)k
        --       0inputs+0outputs (0major+322minor)pagefaults 0swaps
        --       0.00user 0.00system 0:00.28elapsed 0%CPU (0avgtext+0avgdata 1876maxresident)k
        --       0inputs+0outputs (0major+322minor)pagefaults 0swaps
        --
        -- NOTE: '+' (unnamedplus): For Windows and macOS (system clipboard)
        --       '*' (unnamed)    : Exclusively for Linux (it's selection clipboard)
        --       See more: https://stackoverflow.com/a/30691754/15029223
      end
    end,
  },
}
