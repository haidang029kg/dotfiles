return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function()
    vim.g.barbar_auto_setup = false

    -- next & previous buffers
    vim.keymap.set('n', 'Bh', '<Cmd>BufferPrevious<CR>', {
      desc = '[b]uffer [p]revious',
    })
    vim.keymap.set('n', 'Bl', '<Cmd>BufferNext<CR>', {
      desc = '[b]uffer [n]ext',
    })
    -- close buffer
    vim.keymap.set('n', 'Bd', '<Cmd>BufferClose<CR>', {
      desc = '[b]uffer close',
    })
    vim.keymap.set('n', 'Bc', '<Cmd>BufferCloseAllButCurrent<CR>', {
      desc = '[b]uffer [c]lose all but keep the current',
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
