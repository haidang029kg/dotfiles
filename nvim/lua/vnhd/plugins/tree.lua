return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    { 'echasnovski/mini.nvim', version = '*' },
  },
  config = function()
    require('nvim-tree').setup {
      view = { adaptive_size = true },
      filters = {
        dotfiles = false,
        git_clean = false,
        no_buffer = false,
        custom = { '__pycache__' },
        exclude = { '.log' },
      },
      update_focused_file = {
        enable = true,
        update_cwd = false,
      },
    }

    vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>:NvimTreeFindFileToggle<CR>', { noremap = true, desc = 'File [e]xplorer' })
  end,
}
