-- Disable the default Python 3 provider
vim.g.loaded_python3_provider = 0

-- Specify the path to the Python 3 interpreter
-- global install pip neovim to global python interpreter
vim.g.python3_host_prog = '~/.pyenv/shims/python'
