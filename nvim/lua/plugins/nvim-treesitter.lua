return {
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  opts = {
    ensure_installed = {
      "vim",
      "lua",
      "vimdoc",
      "html",
      "css",
      "python",
      "sql",
      "yaml",
      "tsx",
      "typescript",
      "javascript",
      "json",
      "bash",
    },
  },
}
