-- Extend NvChad's telescope config
local options = {
  defaults = {
    -- Your custom mappings/settings here
  },
}

-- Apply custom highlight
vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#1e3a8a", fg = "#ffffff" })

return options
