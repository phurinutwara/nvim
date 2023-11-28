return {
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		keys = {
			{ "<Tab>",   "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
			{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
		},
		dependencies = {
			"catppuccin"
		},
		config = function()
			require("bufferline").setup {
				highlights = require("catppuccin.groups.integrations.bufferline").get(),
				options = {
					mode = "tabs",
					show_buffer_close_icons = false,
					show_close_icon = false,
				}
			}
		end
	},
}
