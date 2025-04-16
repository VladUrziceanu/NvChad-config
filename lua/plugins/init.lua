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
    event = "User FilePost",
    config = function()
      vim.g.linuxsty_patterns = { "/linux/", "/kernel/", "/kernel-" }
    end,
  },
  {
    "dhananjaylatkar/cscope_maps.nvim",
    event = "User FilePost",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- optional [for devicons in telescope, fzf or mini.pick]
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      prefix = "<C-\\>",
      cscope = {
        db_build_cmd = { script = "default", args = { "-Rkbqv" } },
        picker = "telescope",
      },
    },
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end
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
  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      local conf = require "nvchad.configs.telescope"

      table.insert(conf.extensions_list, "fzf")
      conf.defaults.vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--follow",
        "--glob=!.git",
        "--glob=!*.idx",
        "--glob=!.repo",
        "--glob=!.environment",
        "--glob=!cscope*",
        }

      return conf
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    lazy = false,
  },
  {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({
        oldfiles = {
          include_current_session = false,
          cwd_only = true
        },
        grep_opts = "--smart-case --binary-files=without-match --line-number --recursive --color=auto --perl-regexp -e",
        files = {
          rg_opts = [[--color=never --files --hidden --follow -g "!.git" -g "!*.idx" -g "!.repo" -g "!.environment" -g "!out" -g "!bazel-*"]],
          fd_opts = [[--color=never --type f --hidden --follow --exclude .git --exclude out --exclude bazel-bin --exclude "bazel-*"]],
        },
      })
    end,
  },
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    config = function()
      return require "configs.oil"
    end,
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  },
}
