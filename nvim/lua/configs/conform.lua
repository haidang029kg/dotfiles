-- Helper function to check for prettier config in project root
local function has_prettier_cfg(bufnr)
  local cwd = vim.fn.getcwd()

  local prettier_files = {
    ".prettierrc",
    ".prettierrc.json",
    ".prettierrc.js",
    ".prettierrc.yaml",
    ".prettierrc.yml",
    "prettier.config.js",
  }

  for _, file in ipairs(prettier_files) do
    if vim.fn.filereadable(cwd .. "/" .. file) == 1 then
      return true
    end
  end

  return false
end

-- Helper to get formatters based on prettier availability
local function get_js_formatters(bufnr)
  if has_prettier_cfg(bufnr) then
    return { "prettierd", "eslint_d" }
  else
    return { "eslint_d" }
  end
end

local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_format" },
    typescript = get_js_formatters,
    typescriptreact = get_js_formatters,
    yaml = { "prettier" },
    json = { "jq" },
    sql = { "sqlfluff" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  formatters = {
    sqlfluff = {
      command = "sqlfluff",
      args = { "format", "--config", vim.fn.expand("~/.config/.sqlfluff"), "-" },
      stdin = true,
    },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
