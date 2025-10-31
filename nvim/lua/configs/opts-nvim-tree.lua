-- Extend NvChad's nvim-tree config
local options = {
  view = {
    adaptive_size = true,
  },
  update_focused_file = {
    enable = true,
    update_cwd = false,
  },
  git = {
    ignore = false,
  },
  filters = {
    custom = {
      "__pycache__",
      "*.pyc",
      ".DS_Store",
    },
  },
}

return options
