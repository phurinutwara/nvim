local vmap = function(keys, func, desc)
  if desc then
    desc = 'ThePrimeagen: ' .. desc
  end

  vim.keymap.set('v', keys, func, { buffer = bufnr, desc = desc })
end

local nmap = function(keys, func, desc)
  if desc then
    desc = 'ThePrimeagen: ' .. desc
  end

  vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
end

local xmap = function(keys, func, desc)
  if desc then
    desc = 'ThePrimeagen: ' .. desc
  end

  vim.keymap.set('x', keys, func, { buffer = bufnr, desc = desc })
end

local imap = function(keys, func, desc)
  if desc then
    desc = 'ThePrimeagen: ' .. desc
  end

  vim.keymap.set('i', keys, func, { buffer = bufnr, desc = desc })
end

vmap('J', ":m '>+1<CR>gv=gv", 'Move selection downward')
vmap('K', ":m '<-2<CR>gv=gv", 'Move selection upward')

nmap('J', 'mzJ`z', '[J]oin line with steady cursor')
nmap('<C-d>', '<C-d>zz', 'Move [D]own and center-screen')
nmap('<C-u>', '<C-u>zz', 'Move [U]p and center-screen')
nmap('n', 'nzzzv', '[N]ext search and center-screen')
nmap('N', 'Nzzzv', 'Previous search and center-screen')

-- greatest remap ever
xmap('<leader>p', [["_dP]], '[P]aste without lose yank')

-- next greatest remap ever : asbjornHaland
nmap('<leader>y', [["+y]], '[Y]ank to clipboard')
vmap('<leader>y', [["+y]], '[Y]ank to clipboard')
nmap('<leader>Y', [["+Y]], '[Y]ank line to clipboard')

nmap('<leader>d', [["_d]], '[D]elete without lose yank')
vmap('<leader>d', [["_d]], '[D]elete without lose yank')

-- make Ctrl-C more useful
imap('<C-c>', '<Esc>', 'Quit insertion (ESC)')

nmap('Q', '<nop>')
-- nmap('<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')
-- nmap('<leader>f', vim.lsp.buf.format, '[F]ormat with LSP')
-- nmap('<leader>nf', '<cmd>Neoformat<CR>', '[N]eo[F]ormat')
-- vmap('<leader>nf', ":'<,'>Neoformat<CR>", '[N]eo[F]ormat Selection')

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

nmap('<leader>S', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], 'Fast [S]earch in buffer')
nmap('<leader>X', '<cmd>!chmod +x %<CR>', 'Grant e[X]ecutable')

-- Vim-fugitive
nmap('<leader>gs', vim.cmd.Git, 'Open Vim-fugitive')

-- windows resize (credit: https://www.reddit.com/r/neovim/comments/10wru1c/comment/j7osls8)
vim.keymap.set('n', '+', [[<cmd>vertical resize +5<cr>]]) -- make the window biger vertically
vim.keymap.set('n', '_', [[<cmd>vertical resize -5<cr>]]) -- make the window smaller vertically
-- vim.keymap.set('n', '+', [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
-- vim.keymap.set('n', '_', [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -

-- Tabs (!DEPRECATED, mapped by bufferline.lua instead)
-- nmap("te", ":tabedit ", "Open new tab")
-- nmap("<tab>", ":tabnext<Return>", "Next tab")
-- nmap("<s-tab>", ":tabprev<Return>", "Previous tab")

return {}
