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

-- Autocmd commands
local autocmd = vim.api.nvim_create_autocmd

-- Persistent Cursor
autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Cursor Line on each window
autocmd({ "InsertLeave", "WinEnter" }, {
  callback = function()
    local ok, cl = pcall(vim.api.nvim_win_get_var, 0, "auto-cursorline")
    if ok and cl then
      vim.wo.cursorline = true
      vim.api.nvim_win_del_var(0, "auto-cursorline")
    end
  end,
})

autocmd({ "InsertEnter", "WinLeave" }, {
  callback = function()
    local cl = vim.wo.cursorline
    if cl then
      vim.api.nvim_win_set_var(0, "auto-cursorline", cl)
      vim.wo.cursorline = false
    end
  end,
})
