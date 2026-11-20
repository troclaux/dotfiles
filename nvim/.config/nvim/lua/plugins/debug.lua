return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{
				"mfussenegger/nvim-dap-python",
				-- debugpy is installed through mason (:MasonInstall debugpy),
				-- which puts debugpy-adapter on nvim's PATH
				config = function()
					require("dap-python").setup("debugpy-adapter")
				end,
			},
		},
		keys = {
			{ "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
			{ "<leader>dc", function() require("dap").continue() end, desc = "Start/Continue" },
			{ "<leader>dn", function() require("dap").step_over() end, desc = "Step Over" },
			{ "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
			{ "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
			{ "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
			{ "<leader>dh", function() require("dap.ui.widgets").hover() end, desc = "Hover Variable" },
			{ "<leader>dq", function() require("dap").terminate() end, desc = "Terminate" },
		},
	},
}
