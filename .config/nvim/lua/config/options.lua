local opt = vim.opt -- Shorthand for vim.opt


-- vim.g.mapleader = ";" -- Sets the spacebar as the leader key

-- Indentation settings
opt.expandtab = true -- Use spaces instead of tabs
opt.tabstop = 2      -- Number of spaces a tab represents
opt.shiftwidth = 2   -- Number of spaces for each indentation
opt.softtabstop = 2  -- Number of spaces that a <Tab> counts for while editing
opt.autoindent = true -- Automatically indent new lines
opt.smartindent = true -- Automatically indent new lines in a smart way (like C-style)
opt.foldmethod = 'syntax'

-- Display settings
opt.showcmd = true   -- Show (partial) command in status line
opt.showmatch = true -- Show matching brackets

-- Search settings
opt.ignorecase = true  -- Do case insensitive matching when searching
opt.smartcase = true   -- Do smart case matching (case sensitive if uppercase chars in pattern)
opt.incsearch = true   -- Incremental search

-- Other general settings
opt.autowrite = true -- Automatically save before commands like :next and :rewind
opt.timeoutlen = 1000 -- Time in milliseconds to wait for a mapped sequence to complete
opt.ttimeoutlen = 1000 -- Time in milliseconds to wait for a key code to complete

-- Line numbering (window-local)
vim.wo.relativenumber = true -- Enable relative line numbers
vim.wo.number = true         -- Show current line number

-- Folding settings
opt.foldmethod = "marker" -- Set folding method to 'marker'
opt.foldlevel = 99        -- Set initial fold level to be high (all folds open)

-- History
opt.history = 10000 -- Number of commands to remember in history

-- Hidden buffers
opt.hidden = true -- Allow hidden buffers
opt.wrap = false

-- opt.encoding=UTF-8


vim.diagnostic.enable()
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
})
