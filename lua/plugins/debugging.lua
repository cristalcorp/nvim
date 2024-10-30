return {
	-- https://github.com/mfussenegger/nvim-dap
	"mfussenegger/nvim-dap",
	dependencies = {
		-- https://github.com/rcarriga/nvim-dap-ui
		"rcarriga/nvim-dap-ui",
		-- https://github.com/mfussenegger/nvim-dap-python
		"mfussenegger/nvim-dap-python",
		-- https://github.com/nvim-neotest/nvim-nio
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")
    
    require("dapui").setup()
    require("dap-python").setup()

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		-- https://github.com/mfussenegger/nvim-dap/blob/master/doc/dap.txt (line 524)
		vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<Leader>dc", dap.continue, {})
	end,
}
