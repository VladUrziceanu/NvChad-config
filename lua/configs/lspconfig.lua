require("nvchad.configs.lspconfig").defaults()

local servers = { "clangd", "cmake", "dts_lsp", "pyright" }

vim.lsp.enable(servers)
