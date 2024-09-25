require "nvchad.mappings"

local map = vim.keymap.set

map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")

map("n", "<leader><leader>", "/", { desc = "CMD enter search mode" })
map("n", "<C-space>", "?", { desc = "CMD enter reverse search mode" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "0", "^") --0 goes to first character
map("n", "<leader>X", "<cmd>bufdo bd<cr>") --0 goes to first character
map("n", "<leader>ss", "<cmd>w!<cr>", { desc = "CMD save file" })
map("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "CMD open a new tab" })
map("n", "<leader>tc", "<cmd>tabclose<cr>", { desc = "CMD close the current tab" })

--Move a line of text with ALT+[jk]
map("n", "<A-j>", "<cmd>m+<cr>")
map("n", "<A-k>", "<cmd>m-2<cr>")
map("i", "<A-j>", "<Esc><cmd>m .+1<CR>==gi")
map("i", "<A-k>", "<Esc><cmd>m .-2<CR>==gi")
map("v", "<A-j>", "<cmd>m '>+1<CR>gv=gv")
map("v", "<A-k>", "<cmd>m '>-2<CR>gv=gv")

map("n", "<leader>gd", "<cmd>DiffviewOpen<cr>")
map("n", "<leader>gh", "<cmd>DiffviewFileHistory<cr>")
map("n", "<leader>gfh", "<cmd>DiffviewFileHistory %<cr>")

map("n", "<leader>gb", "<cmd>Git blame<cr>")

map("n", "<leader>ff", "<cmd>FzfLua files<cr>")

map("n", "<F12>", "<cmd>Cs db build<cr>")

map("", ">", ">gv")
map("", "<", "<gv")

map("n", "<leader>fW", "<cmd>Telescope grep_string<cr>")
