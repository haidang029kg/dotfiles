return {
  "lucaSartore/fastspell.nvim",
  event = "BufReadPost",
  build = function()
    local base_path = vim.fn.stdpath("data") .. "/lazy/fastspell.nvim"
    local cmd = base_path .. "/lua/scripts/install." .. (vim.fn.has("win32") == 1 and "cmd" or "sh")
    vim.system({ cmd })
  end,
  config = function()
    require("configs.fastspell")
  end,
}
