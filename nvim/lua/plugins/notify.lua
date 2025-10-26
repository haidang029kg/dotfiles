return {
  "rcarriga/nvim-notify",
  keys = {
    {
      "<leader>un",
      function()
        require("notify").dismiss { silent = true, pending = true }
      end,
      desc = "Dismiss all Notifications",
    },
  },
  opts = require "configs.opts-notify",
  init = function()
    vim.notify = require "notify"
  end,
}
