require "nvchad.options"

-- add yours here!

local opt = vim.opt

-- Line numbers
opt.relativenumber = true

-- Sign column (allow multiple signs: diagnostics, git, spell checker)
opt.signcolumn = "yes:3"  -- always show 3 sign columns (fixed width, no flickering)

-- UI customizations
vim.api.nvim_set_hl(0, "Visual", { bg = "#404040", fg = "#ffffff" })

-- opt.cursorlineopt = 'both' -- to enable cursorline!
