return {
  {
    -- https://github.com/nvim-telescope/telescope.nvim
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    cmd = "Telescope",
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require("telescope.builtin")
        -- Custom keymaps
        vim.keymap.set(
            'n',
            '<leader>ff',
            builtin.find_files,
            { desc = "Find string in filenames" }
        )
        vim.keymap.set(
            'n',
            '<leader>fg',
            builtin.live_grep,
            { desc = "Find string inside files" }
        )
    end
  },
  {
    -- https://github.com/nvim-telescope/telescope-ui-select.nvim
    "nvim-telescope/telescope-ui-select.nvim",
    cmd = "Telescope",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end
  },
}
