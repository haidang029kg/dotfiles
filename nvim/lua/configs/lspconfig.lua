require("nvchad.configs.lspconfig").defaults()

local basic_servers = {
  "html",
  "cssls",
  "lua_ls",
  "jsonls",
  "ts_ls",
  "ruff",
  "yamlls",
  "yaml-language-server",
}

vim.lsp.enable(basic_servers)

-- dynamically configuration
local servers = {
  basedpyright = {
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          typeCheckingMode = "basic",
        },
      },
    },
  },
}

for name, opts in pairs(servers) do
  vim.lsp.enable(name) -- nvim v0.11.0 or above required
  vim.lsp.config(name, opts) -- nvim v0.11.0 or above required
end

-- read :h vim.lsp.config for changing options of lsp servers

-- config lsp diagnostic sources
vim.diagnostic.config {
  virtual_text = {
    source = true,
    prefix = "●",
    format = function(diagnostic)
      if diagnostic.severity == vim.diagnostic.severity.ERROR then
        return diagnostic.message
      end
      return nil -- suppress virtual text for non-errors
    end,
  },
  signs = true,
  underline = true,
  float = {
    source = true,
  },
  -- update_in_insert = false,
  severity_sort = true,
}
