require "nvchad.autocmds"

-- add yours here

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Custom command to optimize Python imports with ruff
vim.api.nvim_create_user_command("RuffOptimizeImports", function()
  local file = vim.fn.expand("%:p")
  if vim.bo.filetype ~= "python" then
    vim.notify("RuffOptimizeImports only works on Python files", vim.log.levels.WARN)
    return
  end

  -- Save the current cursor position
  local cursor_pos = vim.api.nvim_win_get_cursor(0)

  -- Run ruff to organize imports
  local cmd = string.format("ruff check --select I --fix %s", vim.fn.shellescape(file))
  local result = vim.fn.system(cmd)

  -- Reload the buffer to see changes
  vim.cmd("edit!")

  -- Restore cursor position
  vim.api.nvim_win_set_cursor(0, cursor_pos)

  if vim.v.shell_error == 0 then
    vim.notify("Imports optimized successfully", vim.log.levels.INFO)
  else
    vim.notify("Ruff error: " .. result, vim.log.levels.ERROR)
  end
end, { desc = "Optimize Python imports with ruff" })
