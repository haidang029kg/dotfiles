-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "gruvbox",

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
  transparency = false,
}

M.nvdash = { load_on_startup = true }

M.mason = {
  pkgs = {
    -- LSP servers
    "lua-language-server",
    "pyright",
    "typescript-language-server",
    "tailwindcss-language-server",
    "yaml-language-server",

    -- Formatters
    "stylua",
    "prettier",
    "prettierd",
    "ruff", -- (include linter)
    "sqlfluff", -- (include linter)

    -- Linters
    "eslint_d",

    -- DAP
    "debugpy",
    "js-debug-adapter",
  },
}

M.ui = {
  tabufline = {
    lazyload = false,
  },
}

return M
