require "nvchad.options"

-- add yours here!

local opt = vim.opt

-- Line numbers
opt.relativenumber = true

-- UI customizations
vim.api.nvim_set_hl(0, "Visual", { bg = "#404040", fg = "#ffffff" })

-- opt.cursorlineopt = 'both' -- to enable cursorline!
