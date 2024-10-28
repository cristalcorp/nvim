local opt = vim.opt

-- relative line numbers
opt.relativenumber = true -- activate relative line numbers
opt.number = true         -- show the line number instead of 0

-- tabs and indent
opt.tabstop = 2       -- 2 spaces for each tab
opt.shiftwidth = 2    -- 2 spaces for each indent
opt.expandtab = true  -- change tab for spaces
opt.autoindent = true -- keep current indent on next line

-- search
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true  -- become case sensitive if MAJ are used in the search terms
opt.hlsearch = true   -- highlight search results

-- cursor line
opt.cursorline = true -- highlight current line

-- look and feel
opt.termguicolors = true -- necessary for modern themes to work
opt.background = "dark"  -- you know... background color
opt.signcolumn = "no"    -- add another column on the left to avoid moving text

-- backspace ## NO IDEA ! ##
-- opt.backspace = "indent,eol,start" -- allow the use of backspace when we indent, at the start or beginning of the line

-- clipboard
opt.clipboard = "unnamedplus" -- use system clipboard

-- split
opt.splitright = true     -- vertical split shows on the right
opt.splitbelow = true     -- horizontal split shows below

opt.swapfile = false      -- no more swap file

opt.undofile = true       -- infinite undo even after closing and reopening the file

opt.iskeyword:append("-") -- dash separated words are considered as one word

opt.list = true           -- show special characters
opt.listchars:append({ nbsp = "␣", trail = "•", precedes = "«", extends = "»", tab = "> " })

-- Auto command to re open files at the last known position
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local last_pos = vim.fn.line("'\"")
    if last_pos > 0 and last_pos <= vim.fn.line("$") then
      vim.api.nvim_win_set_cursor(0, { last_pos, 0 })
    end
  end,
})
