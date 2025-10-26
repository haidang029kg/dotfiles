return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      local custom_opts = require "configs.opts-telescope"
      return vim.tbl_deep_extend("force", opts, custom_opts)
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = function(_, opts)
      local custom_opts = require "configs.opts-nvim-tree"
      return vim.tbl_deep_extend("force", opts, custom_opts)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      local custom_opts = require "configs.opts-treesitter"
      return vim.tbl_deep_extend("force", opts, custom_opts)
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      scope = { enabled = false },
    },
  },
  -- test new blink
  { import = "nvchad.blink.lazyspec" },
  {
    "Saghen/blink.cmp",
    opts = {
      -- Enable cmdline completion
      cmdline = {
        enabled = true,
        completion = {
          menu = { auto_show = true },
        },
      },
    },
  },
}
