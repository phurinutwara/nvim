return {
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = {
			"mfussenegger/nvim-dap"
		},
		keys = {
			{ "<leader>dt", ":lua require('dapui').toggle()<CR>",             desc = "DAP: Toggle UI" },
			{ "<leader>db", ":DapToggleBreakpoint<CR>",                       desc = "DAP: Toggle Breakpoint" },
			{ "<leader>dc", ":DapContinue<CR>",                               desc = "DAP: Continue" },
			{ "<leader>dr", ":lua require('dapui').open({reset = true})<CR>", desc = "DAP: Reset UI" },
		},
		config = function()
			require("neodev").setup({
				library = { plugins = { "nvim-dap-ui" }, types = true },
			})
			require("dapui").setup()
			vim.fn.sign_define("DapBreakpoint",
				{ text = "🔴", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" })
		end,
	}
}
