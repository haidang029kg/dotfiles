return {
  "nvim-tree/nvim-tree.lua",
  opts = function()
    return {
      view = {
        adaptive_size = true,
      },
      -- the filter dot files "reversed"
      filters = {
        dotfiles = false,
        git_clean = false,
        no_buffer = false,
        custom = { "__pycache__", ".git" },
        exclude = {},
      },
      update_focused_file = {
        enable = true,
        update_cwd = false,
      },
      git = {
        ignore = false,
      },
    }
  end,
}
