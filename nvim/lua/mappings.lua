require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Paste in visual mode without overwriting the register
map("x", "p", '"_dP', { desc = "Paste without overwriting register" })

-- Python: Optimize imports with ruff
map("n", "<leader>oi", "<cmd>RuffOptimizeImports<cr>", { desc = "Optimize imports (ruff)" })

-- Terminal toggle floating (alternative to Alt-i for macOS with Aerospace)
map({ "n", "t" }, "<leader>tf", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
