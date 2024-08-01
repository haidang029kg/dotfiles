require 'vnhd.python'

if vim.g.vscode then
  -- VSCode extension
  require 'vnhd.vscode'
else
  -- ordinary Neovim
  require 'vnhd.core'
  require 'vnhd.key-maps'
  require 'vnhd.lazy'
end
