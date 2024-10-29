return {
  -- https://github.com/nvim-treesitter/nvim-treesitter
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      -- auto_install = true,
      ensure_installed = {
        "lua",
        "javascript",
        "python",
        "rust",
        "go",
        "bash",
        "css",
        "csv",
        "dockerfile",
        "gitignore",
        "html",
        "json",
        "liquid",
        "markdown",
        "markdown_inline",
        "toml",
        "yaml",
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
