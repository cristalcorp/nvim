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
			lspconfig.gopls.setup({
				capabilities = capabilities,
				-- filetypes = {"go", "gomod", "gowork", "gotmpl"},
				-- root_dir = util.root_pattern("go.work", "go.mod", ".git"),
				settings = {
					gopls = {
						completeUnimported = true,
						usePlaceholders = true,
					},
				},
			})
			lspconfig.jsonls.setup({ capabilities = capabilities })
      lspconfig.ltex_plus.setup({
    capabilities = capabilities,
    filetypes = { "markdown", "tex", "plaintex" },
    settings = {
        ltex = {
            language = "fr",
            -- "edit"  = à chaque modif (ce que tu as là, infernal)
            -- "save"  = uniquement quand tu fais :w
            -- "manual" = seulement quand tu appelles explicitement un check
            checkFrequency = "save",
        },
    },
})

			lspconfig.pyright.setup({ capabilities = capabilities })
			lspconfig.rust_analyzer.setup({ capabilities = capabilities })
			lspconfig.yamlls.setup({ capabilities = capabilities })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "je sais plus" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "show definition" })
			vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "show references" })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "code action" })
		end,
	},
}
