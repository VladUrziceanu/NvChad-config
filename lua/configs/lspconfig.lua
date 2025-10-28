require("nvchad.configs.lspconfig").defaults()

local servers = { "clangd", "cmake", "dts_lsp", "pyright", "lua_ls" }

vim.lsp.enable(servers)
