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
map("i", "<A-j>", "<Esc><cmd>m .+1<cr>==gi")
map("i", "<A-k>", "<Esc><cmd>m .-2<cr>==gi")
map("v", "<A-j>", "<cmd>m '>+1<cr>gv=gv")
map("v", "<A-k>", "<cmd>m '>-2<cr>gv=gv")

map("n", "<leader>gd", "<cmd>DiffviewOpen<cr>")
map("n", "<leader>gfh", "<cmd>DiffviewFileHistory<cr>")
map("n", "<leader>gfH", "<cmd>DiffviewFileHistory %<cr>")

map("n", "<leader>gb", "<cmd>Git blame<cr>")

--Replace telescope mappings with faster fzflua
map("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "fzflua find files" })
map("n", "<leader>fw", "<cmd>FzfLua live_grep<cr>", { desc = "fzflua live grep" })
map("n", "<leader>fW", "<cmd>FzfLua grep_cword<cr>", { desc = "fzflua grep word under cursor" })
map("n", "<leader>fb", "<cmd>FzfLua buffers<cr>", { desc = "fzflua find buffers" })
map("n", "<leader>fh", "<cmd>FzfLua helptags<cr>", { desc = "fzflua help page" })
map("n", "<leader>ma", "<cmd>FzfLua marks<cr>", { desc = "fzflua find marks" })
map("n", "<leader>fo", "<cmd>FzfLua oldfiles<cr>", { desc = "fzflua find oldfiles" })
map("n", "<leader>fz", "<cmd>FzfLua blines<cr>", { desc = "fzflua find in current buffer" })
map("n", "<leader>cm", "<cmd>FzfLua git_commits<cr>", { desc = "fzflua git commits" })
map("n", "<leader>cbm", "<cmd>FzfLua git_bcommits<cr>", { desc = "fzflua git commits (buffer)" })
map("n", "<leader>gs", "<cmd>FzfLua git_status<cr>", { desc = "fzflua git status" })
map("n", "<leader>fr", "<cmd>FzfLua resume<cr>", { desc = "fzflua resume" })

--Lsp mappings
map("n", "grs", "<cmd>FzfLua lsp_live_workspace_symbols<cr>", { desc = "workspace symbols" })
map("n", "grS", "<cmd>FzfLua lsp_document_symbols<cr>", { desc = "document symbols" })
map("n", "grr", "<cmd>FzfLua lsp_references<cr>", { desc = "lsp references" })
map("n", "grI", "<cmd>FzfLua lsp_incoming_calls<cr>", { desc = "lsp incoming calls" })
map("n", "grO", "<cmd>FzfLua lsp_outgoing_calls<cr>", { desc = "lsp outgoing calls" })
map("n", "grf", "<cmd>FzfLua lsp_finder<cr>", { desc = "lsp finder" })
map("n", "grd", "<cmd>FzfLua lsp_definitions<cr>", { desc = "lsp go to definition" })
map("n", "grt", "<cmd>FzfLua lsp_typedefs<cr>", { desc = "lsp go to type definition" })
map("n", "grD", "<cmd>FzfLua lsp_declarations<cr>", { desc = "lsp go to declaration" })
map("n", "gri", "<cmd>FzfLua lsp_implementations<cr>", { desc = "lsp go to implementation" })
map("n", "gra", "<cmd>FzfLua lsp_code_actions<cr>", { desc = "lsp code actions" })
map("n", "grx", "<cmd>FzfLua lsp_document_diagnostics<cr>", { desc = "lsp document diagnostics" })

map("n", "<F12>", "<cmd>Cs db build<cr>")

map("", ">", ">gv")
map("", "<", "<gv")


map("n", "<leader>sa", "<cmd>ASToggle<cr>", { desc = "CMD toggle auto save" })

map("n", "<leader>o", "<CMD>Oil<cr>", { desc = "Open parent directory" })

--gitsigns mappings
require('gitsigns').setup{
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({']c', bang = true})
      else
        gitsigns.nav_hunk('next')
      end
    end)

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({'[c', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end)

    -- Actions
    map('n', '<leader>ghs', gitsigns.stage_hunk, { desc = 'stage hunk' })
    map('n', '<leader>ghr', gitsigns.reset_hunk, { desc = 'reset hunk' })

    map('n', '<leader>ghS', gitsigns.stage_buffer, { desc = 'stage buffer' })
    map('n', '<leader>ghR', gitsigns.reset_buffer, { desc = 'reset buffer' })
    map('n', '<leader>ghp', gitsigns.preview_hunk, { desc = 'preview hunk' })
    map('n', '<leader>ghi', gitsigns.preview_hunk_inline, { desc = 'preview hunk inline' })

    -- Text object
    map({'o', 'x'}, 'gih', gitsigns.select_hunk, { desc = 'select hunk' })
  end
}
