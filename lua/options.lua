require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorline = true
o.cursorlineopt ='both' -- to enable cursorline!
vim.highlight.cursorline = 'term=bold cterm=bold ctermbg=236'

-- List trailing whitespaces and tabs
o.list = true
o.listchars ='tab:» ,trail:·'
o.scrolloff = 5
