local fastspell = require "fastspell"

-- Setup fastspell
fastspell.setup {
  namespace = "fastspell",
  filter_by_buf_type = true,
}

-- Auto-check visible lines (as you type)
vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI", "BufEnter", "WinScrolled" }, {
  group = vim.api.nvim_create_augroup("fastspell_check", { clear = true }),
  callback = function(_)
    local first_line = vim.fn.line "w0" - 1
    local last_line = vim.fn.line "w$"
    fastspell.sendSpellCheckRequest(first_line, last_line)
  end,
})

-- Keymap to manually check entire buffer
vim.keymap.set("n", "<leader>sc", function()
  fastspell.sendSpellCheckRequest(0, -1)
end, { desc = "Spell check entire buffer" })
