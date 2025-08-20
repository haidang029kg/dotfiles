return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function()
    vim.g.barbar_auto_setup = false

    -- next & previous buffers
    vim.api.nvim_set_keymap('n', 'H', '<Cmd>BufferPrevious<CR>', {
      desc = 'buffer previous',
    })
    vim.api.nvim_set_keymap('n', 'L', '<Cmd>BufferNext<CR>', {
      desc = 'buffer next',
    })

    -- close buffer
    vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>:BufferClose<CR>', {
      desc = 'buffer close',
    })
    vim.api.nvim_set_keymap('n', '<leader>Q', '<Cmd>BufferCloseAllButCurrent<CR>', {
      desc = 'buffer close all but keep the current',
    })
  end,
  opts = {
    -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
    -- animation = true,
    -- insert_at_start = true,
    -- …etc.
  },
  version = '^1.0.0', -- optional: only update when a new 1.x version is released
}
