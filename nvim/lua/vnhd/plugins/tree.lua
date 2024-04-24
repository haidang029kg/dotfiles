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
    }

    vim.api.nvim_set_keymap('n', '<C-e>', '<cmd>:NvimTreeToggle<CR>', { noremap = true })
  end,
}

