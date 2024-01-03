return {
	"famiu/bufdelete.nvim",
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		keys = {
			{ "<Tab>",   "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
			{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
			{ "]b",      "<Cmd>BufferLineMoveNext<CR>",  desc = "Move to next tab" },
			{ "[b",      "<Cmd>BufferLineMovePrev<CR>",  desc = "Move to previous tab" },
		},
		dependencies = {
			"catppuccin"
		},
		config = function()
			require("bufferline").setup {
				highlights = require("catppuccin.groups.integrations.bufferline").get(),
				options = {
					mode = "buffers",
					numbers = function(opts)
						return string.format('%s·%s',
							opts.raise(opts.ordinal),
							opts.lower(opts.id)
						)
					end,
					offsets = {
						{
							filetype = "NvimTree",
							text = "File Explorer",
							seperator = true,
						}
					},
					close_command = require('bufdelete').bufdelete,
					-- show_buffer_close_icons = false,
					-- show_close_icon = false,
				}
			}
		end
	},
}
