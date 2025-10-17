-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "aquarium",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
  transparency = true,
}

M.nvdash = { load_on_startup = true }

M.mason = {
  pkgs = {
    -- LSP servers
    "lua-language-server",
    "pyright",
    "typescript-language-server",
    "yaml-language-server",

    -- Formatters
    "stylua",
    "prettier",
    "prettierd",
    "ruff", -- (include linter)

    -- Linters
    "eslint_d",

    -- DAP
    "debugpy",
    "js-debug-adapter",
  },
}

-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

return M
