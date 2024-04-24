return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup()

    -- Document existing key chains
    require('which-key').register {
      ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
      ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
      ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
      ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
      ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
      ['<leader>l'] = { name = '[L]azy', _ = 'which_key_ignore' },
      ['<leader>x'] = { name = 'Diagnostic', _ = 'which_key_ignore' },
      ['<leader>m'] = { name = 'Maximize/minimize', _ = 'which_key_ignore' },
      ['<leader>B'] = { name = '[B]uffer', _ = 'which_key_ignore' },
    }
  end,
}
