vim.opt.relativenumber = true

-- Patse in visual mode without overwriting the register
vim.keymap.set({ "n", "v" }, "p", "P")

--
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_set_hl(0, "Visual", { bg = "#404040", fg = "#ffffff" })
