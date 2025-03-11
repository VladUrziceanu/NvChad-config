require "nvchad.mappings"

local map = vim.keymap.set
local unmap = vim.keymap.del

unmap("n", "<C-c>")

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

--Replace telescope mappings with faster fzflua
map("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "fzflua find files" })
map("n", "<leader>fw", "<cmd>FzfLua live_grep<cr>", { desc = "fzflua live grep" })
map("n", "<leader>fW", "<cmd>FzfLua grep_cword<cr>", { desc = "fzflua grep word under cursor" })
map("n", "<leader>fb", "<cmd>FzfLua buffers<CR>", { desc = "fzflua find buffers" })
map("n", "<leader>fh", "<cmd>FzfLua helptags<CR>", { desc = "fzflua help page" })
map("n", "<leader>ma", "<cmd>FzfLua marks<CR>", { desc = "fzflua find marks" })
map("n", "<leader>fo", "<cmd>FzfLua oldfiles<CR>", { desc = "fzflua find oldfiles" })
map("n", "<leader>fz", "<cmd>FzfLua blines<CR>", { desc = "fzflua find in current buffer" })
map("n", "<leader>cm", "<cmd>FzfLua git_commits<CR>", { desc = "fzflua git commits" })
map("n", "<leader>gt", "<cmd>FzfLua git_status<CR>", { desc = "fzflua git status" })

--Lsp mappings
map("n", "<leader>fs", "<cmd>FzfLua lsp_live_workspace_symbols<CR>", { desc = "fzflua workspace symbols" })
map("n", "<leader>fds", "<cmd>FzfLua lsp_document_symbols<CR>", { desc = "fzflua document symbols" })
map("n", "<leader>gr", "<cmd>FzfLua lsp_references<CR>", { desc = "fzflua lsp references" })
map("n", "<leader>rn", "vim.lsp.buf.rename()", { desc = "lsp rename" })

map("n", "<F12>", "<cmd>Cs db build<cr>")

map("", ">", ">gv")
map("", "<", "<gv")


map("n", "<leader>sa", "<cmd>ASToggle<cr>", { desc = "CMD toggle auto save" })

map("n", "<leader>o", "<CMD>Oil<CR>", { desc = "Open parent directory" })
