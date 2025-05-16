require("nvchad.configs.lspconfig").defaults()

local servers = { "clangd", "cmake", "pyright" }

vim.lsp.enable(servers)
