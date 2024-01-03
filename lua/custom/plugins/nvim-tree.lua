return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	requires = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		-- disable netrw at the very start of your init.lua
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- set termguicolors to enable highlight groups
		vim.opt.termguicolors = true


		-- Smart nvim-tree toggling
		-- See more: https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes#smart-nvim-tree-toggling
		local nvimTreeFocusOrToggle = function()
			local nvimTree = require("nvim-tree.api")
			local currentBuf = vim.api.nvim_get_current_buf()
			local currentBufFt = vim.api.nvim_get_option_value("filetype", { buf = currentBuf })
			if currentBufFt == "NvimTree" then
				nvimTree.tree.toggle()
			else
				nvimTree.tree.focus()
			end
		end
		vim.keymap.set("n", "<leader>b", nvimTreeFocusOrToggle, { desc = "Toggle sidebar" })

		require("nvim-tree").setup({
			disable_netrw = true,
			update_focused_file = {
				enable = true,
			},
			filters = {
				git_ignored = false,
			},
		})
	end,
}
