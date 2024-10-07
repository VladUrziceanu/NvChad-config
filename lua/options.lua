require "nvchad.options"

local o = vim.o
o.cursorline = true
o.cursorlineopt ='both'
vim.highlight.cursorline = 'term=bold cterm=bold ctermbg=236'
o.colorcolumn = '80'
o.textwidth = 77
o.clipboard = ""

-- List trailing whitespaces and tabs
o.list = true
o.listchars ='tab:» ,trail:·'
o.scrolloff = 5

-- Disable backup and swap files
o.backup = false
o.wb = false
o.swapfile = false
