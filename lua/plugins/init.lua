return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "vivien/vim-linux-coding-style",
    lazy = false,
    config = function()
      vim.g.linuxsty_patterns = { "/linux/", "/kernel/", "/kernel-6.6/" }
    end,
  },
  {
    "dhananjaylatkar/cscope_maps.nvim",
    cmd = "Cs",
    dependencies = {
      "folke/which-key.nvim", -- optional [for whichkey hints]
      "nvim-tree/nvim-web-devicons", -- optional [for devicons in telescope, fzf or mini.pick]
    },
    opts = {
      prefix = "<C-\\>",
      cscope = {
        db_build_cmd_args = { "-Rkb" },
        picker = "telescope",
      },
    },
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  },
  {
    "tpope/vim-fugitive",
    event = "User FilePost",
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    opts = function()
      return require "configs.gitsigns"
    end,
  },
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
