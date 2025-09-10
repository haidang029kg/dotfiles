return {
  "nvim-telescope/telescope.nvim",
  config = function()
    -- Set custom telescope highlight
    vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#1e3a8a", fg = "#ffffff" })
  end,
}
