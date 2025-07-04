-- clear highlight search
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Set key map for double jj to escape
vim.keymap.set({ 'i' }, 'jj', '<Esc>')

-- Move current line up or down
vim.api.nvim_set_keymap('n', 'K', ':m .-2<CR>==', {
	noremap = true,
	silent = true,
	desc = 'Move line up',
})
vim.api.nvim_set_keymap('n', 'J', ':m .+1<CR>==', {
	noremap = true,
	silent = true,
	desc = 'Move line down',
})

-- Merge the line below to the current
vim.api.nvim_set_keymap('n', '<leader>J', 'J', {
	noremap = true,
	silent = true,
	desc = 'Merge line below to the current',
})

-- Patse in visual mode without overwriting the register
vim.keymap.set({ 'n', 'v' }, 'p', 'P')

-- -- Go to line end (normal and visual mode)
-- vim.keymap.set({ 'n', 'v' }, 'L', '$')
-- -- Go to line beginning (normal and visual mode)
-- vim.keymap.set({ 'n', 'v' }, 'H', '^')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
