-- Set your leader key
vim.g.mapleader = ' '

vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.tabstop = 4 -- Set tab size to 4 spaces
vim.opt.shiftwidth = 4 -- Set indent size to 4 spaces
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.wrap = false -- Disable line wrapping
vim.opt.showmatch = true
vim.opt.hlsearch = true -- Highlitghts search results
vim.opt.incsearch = true -- Incremental search
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.smartcase = true -- Ignore case if search pattern is all lowercase

-- Patse in visual mode without overwriting the register
vim.keymap.set({ 'n', 'v' }, 'p', 'P')

-- Go to line end (normal and visual mode)
vim.keymap.set({ 'n', 'v' }, 'L', '$')
-- Go to line beginning (normal and visual mode)
vim.keymap.set({ 'n', 'v' }, 'H', '^')

-- Clear search highlights
vim.keymap.set('n', '<leader>cs', '<cmd>noh<CR>', {})

-- Quit, Save
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', {})

-- functions for vs code commands
local commonCommands = {
  showCommands = function()
    vim.fn.VSCodeCall 'workbench.action.showCommands'
  end,
}

local document = {
  formatDocument = function()
    vim.fn.VSCodeCall 'editor.action.formatDocument'
    vim.fn.VSCodeCall 'workbench.action.files.save'
  end,
  save = function()
    vim.fn.VSCodeCall 'workbench.action.files.save'
  end,
  moveLineUp = function()
    vim.fn.VSCodeCall 'editor.action.moveLinesUpAction'
  end,
  moveLineDown = function()
    vim.fn.VSCodeCall 'editor.action.moveLinesDownAction'
  end,
}

local navigation = {
  previousEditor = function()
    vim.fn.VSCodeCall 'workbench.action.previousEditor'
  end,
  nextEditor = function()
    vim.fn.VSCodeCall 'workbench.action.nextEditor'
  end,
  navigateBack = function()
    vim.fn.VSCodeCall 'workbench.action.navigateBack'
  end,
  navigateForward = function()
    vim.fn.VSCodeCall 'workbench.action.navigateForward'
  end,
}

local projects = {
  goToFile = function()
    vim.fn.VSCodeCall 'workbench.action.quickOpen'
  end,
  switch = function()
    vim.fn.VSCodeNotify 'workbench.action.openRecent'
  end,
  tree = function()
    vim.fn.VSCodeNotify 'workbench.view.explorer'
  end,
}

local vscode = {
  moveSideBarRight = function()
    vim.fn.VSCodeCall 'workbench.action.moveSideBarRight'
  end,
  moveSideBarLeft = function()
    vim.fn.VSCodeCall 'workbench.action.moveSideBarLeft'
  end,
  toggleActivityBar = function()
    vim.fn.VSCodeNotify 'workbench.action.toggleActivityBarVisibility'
  end,
  toggleSideBarVisibility = function()
    vim.fn.VSCodeNotify 'workbench.action.toggleSidebarVisibility'
  end,
  toggleZenMode = function()
    vim.fn.VSCodeNotify 'workbench.action.toggleZenMode'
  end,
}

local bookmark = {
  toggle = function()
    vim.fn.VSCodeNotify 'bookmarks.toggle'
  end,
  list = function()
    vim.fn.VSCodeNotify 'bookmarks.list'
  end,
  previous = function()
    vim.fn.VSCodeNotify 'bookmarks.jumpToPrevious'
  end,
  next = function()
    vim.fn.VSCodeNotify 'bookmarks.jumpToNext'
  end,
}

local symbol = {
  rename = function()
    vim.fn.VSCodeNotify 'editor.action.rename'
  end,
}

local fold = {
  toggle = function()
    vim.fn.VSCodeNotify 'editor.toggleFold'
  end,

  all = function()
    vim.fn.VSCodeNotify 'editor.foldAll'
  end,
  openAll = function()
    vim.fn.VSCodeNotify 'editor.unfoldAll'
  end,

  close = function()
    vim.fn.VSCodeNotify 'editor.fold'
  end,
  open = function()
    vim.fn.VSCodeNotify 'editor.unfold'
  end,
  openRecursive = function()
    vim.fn.VSCodeNotify 'editor.unfoldRecursively'
  end,

  blockComment = function()
    vim.fn.VSCodeNotify 'editor.foldAllBlockComments'
  end,

  allMarkerRegion = function()
    vim.fn.VSCodeNotify 'editor.foldAllMarkerRegions'
  end,
  openAllMarkerRegion = function()
    vim.fn.VSCodeNotify 'editor.unfoldAllMarkerRegions'
  end,
}

-- basic commands
vim.keymap.set({ 'n' }, '<leader>w', document.save) -- save
vim.keymap.set({ 'n' }, '<leader>cmd', commonCommands.showCommands) -- show commands
vim.keymap.set({ 'n' }, '<leader>f', document.formatDocument) -- format document
vim.keymap.set({ 'v' }, '<leader>rn', symbol.rename) -- rename symbol
vim.keymap.set({ 'n' }, 'K', document.moveLineUp) -- move line up
vim.keymap.set({ 'n' }, 'J', document.moveLineDown) -- move line down

-- navigation
vim.keymap.set({ 'n' }, '<leader>b', navigation.navigateBack)
vim.keymap.set({ 'n' }, '<leader>B', navigation.navigateForward)
vim.keymap.set('n', '<C-l>', navigation.nextEditor)
vim.keymap.set('n', '<C-h>', navigation.previousEditor)

-- project -> p
vim.keymap.set({ 'n' }, '<leader>sf', projects.goToFile) -- quickly open file
vim.keymap.set({ 'n' }, '<leader>pp', projects.switch) -- switch project
vim.keymap.set({ 'n' }, '<leader>pt', projects.tree) -- view explorer

-- vscode workbench -> t
vim.keymap.set({ 'n' }, '<leader>tl', vscode.moveSideBarLeft)
vim.keymap.set({ 'n' }, '<leader>tr', vscode.moveSideBarRight)
vim.keymap.set({ 'n', 'v' }, '<leader>ta', vscode.toggleActivityBar)
vim.keymap.set({ 'n', 'v' }, '<leader>ts', vscode.toggleSideBarVisibility)
vim.keymap.set({ 'n', 'v' }, '<leader>tz', vscode.toggleZenMode)

-- bookmark -> m
vim.keymap.set({ 'n' }, '<leader>mt', bookmark.toggle)
vim.keymap.set({ 'n' }, '<leader>ml', bookmark.list)
vim.keymap.set({ 'n' }, '<leader>mn', bookmark.next)
vim.keymap.set({ 'n' }, '<leader>mp', bookmark.previous)

-- folding -> z
vim.keymap.set({ 'n' }, '<leader>zr', fold.openAll)
vim.keymap.set({ 'n' }, '<leader>zO', fold.openRecursive)
vim.keymap.set({ 'n' }, '<leader>zo', fold.open)
vim.keymap.set({ 'n' }, '<leader>zm', fold.all)
vim.keymap.set({ 'n' }, '<leader>zb', fold.blockComment)
vim.keymap.set({ 'n' }, '<leader>zc', fold.close)
vim.keymap.set({ 'n' }, '<leader>zg', fold.allMarkerRegion)
vim.keymap.set({ 'n' }, '<leader>zG', fold.openAllMarkerRegion)
vim.keymap.set({ 'n' }, '<leader>za', fold.toggle)
