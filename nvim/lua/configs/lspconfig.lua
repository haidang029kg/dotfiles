require("nvchad.configs.lspconfig").defaults()

local servers = {
  html = {},
  cssls = {},
  lua_ls = {},
  jsonls = {},
  ruff = {},
  yamlls = {},

  pyright = {
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          typeCheckingMode = "basic",
        },
      },
    },
  },

  ts_ls = {
    settings = {
      typescript = {
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
        },
      },
      javascript = {
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
        },
      },
    },
  },
}

-- Get blink.cmp LSP capabilities
-- local capabilities = require("blink.cmp").get_lsp_capabilities()

for name, opts in pairs(servers) do
  -- Merge blink.cmp capabilities with any existing capabilities
  -- opts.capabilities = capabilities(opts.capabilities)

  vim.lsp.config(name, opts)
  vim.lsp.enable(name)
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
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "✘",
      [vim.diagnostic.severity.WARN] = "▲",
      [vim.diagnostic.severity.HINT] = "⚑",
      [vim.diagnostic.severity.INFO] = "»",
    },
  },
  underline = true,
  float = {
    source = true,
    border = "rounded",
  },
  -- update_in_insert = false,
  severity_sort = true,
}
