return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('nvim-tree').setup {
      view = { adaptive_size = true },
      filters = {
        dotfiles = false,
        git_clean = false,
        no_buffer = false,
        custom = { '__pycache__' },
      },
      update_focused_file = {
        enable = true,
        update_cwd = false,
      },
    }

    vim.api.nvim_set_keymap('n', '<C-e>', '<cmd>:NvimTreeToggle<CR>', { noremap = true })
  end,
}
