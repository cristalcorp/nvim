return {
	{
		-- https://github.com/williamboman/mason.nvim
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		-- https://github.com/williamboman/mason-lspconfig.nvim
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
		-- config = function()
		-- require("mason-lspconfig").setup({
		-- ensure_installed = {
		--"lua_ls",
		--"dockerls",
		--"gopls",
		--"jsonls",
		--"ltex",
		--"pyright",
		--"rust_analyzer",
		--"yamlls",
		--},
		--})
		--end,
	},
	{
		-- https://github.com/neovim/nvim-lspconfig
		"neovim/nvim-lspconfig",
		laszy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			--languages
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.dockerls.setup({ capabilities = capabilities })
			lspconfig.gopls.setup({ capabilities = capabilities })
			lspconfig.jsonls.setup({ capabilities = capabilities })
			lspconfig.ltex.setup({ capabilities = capabilities })
			lspconfig.pyright.setup({ capabilities = capabilities })
			lspconfig.rust_analyzer.setup({ capabilities = capabilities })
			lspconfig.yamlls.setup({ capabilities = capabilities })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "je sais plus" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "je sais plus" })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "code action" })
		end,
	},
}
