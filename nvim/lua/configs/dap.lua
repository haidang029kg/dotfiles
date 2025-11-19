local dap = require "dap"
local dapui = require "dapui"
local dap_virtual_text = require "nvim-dap-virtual-text"
local dap_python = require "dap-python"

dapui.setup()

dap_python.setup()

-- Configure Node.js debug adapter (following the article's approach)
dap.adapters["pwa-node"] = {
  type = "server",
  host = "::1",
  port = "${port}",
  executable = {
    command = "js-debug-adapter",
    args = { "${port}" },
  },
}

dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    pythonPath = function()
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
        return cwd .. "/venv/bin/python"
      elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
        return cwd .. "/.venv/bin/python"
      else
        return "/usr/bin/python"
      end
    end,
  },
}

dap.configurations.typescript = {
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    cwd = "${workspaceFolder}",
  },
}

dap_virtual_text.setup {
  commented = false, -- Show virtual text alongside comment
  enabled = false,
}

-- DAP event listeners (without auto-opening UI)
dap.listeners.before.attach.dapui_config = function()
  -- Don't auto-open UI, but keep listener for proper DAP initialization
end
dap.listeners.before.launch.dapui_config = function()
  -- Don't auto-open UI, but keep listener for proper DAP initialization
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

vim.fn.sign_define("DapBreakpoint", {
  text = "",
  texthl = "DiagnosticSignError",
  linehl = "",
  numhl = "",
})

vim.fn.sign_define("DapBreakpointRejected", {
  text = "", -- or "❌"
  texthl = "DiagnosticSignError",
  linehl = "",
  numhl = "",
})

vim.fn.sign_define("DapStopped", {
  text = "", -- or "→"
  texthl = "DiagnosticSignWarn",
  linehl = "Visual",
  numhl = "DiagnosticSignWarn",
})

local opts = { noremap = true, silent = true }

-- Toggle breakpoint
vim.keymap.set("n", "<leader>db", function()
  dap.toggle_breakpoint()
end, opts)

-- Continue / Start
vim.keymap.set("n", "<leader>dc", function()
  dap.continue()
end, opts)

-- Step Over
vim.keymap.set("n", "<leader>do", function()
  dap.step_over()
end, opts)

-- Step Into
vim.keymap.set("n", "<leader>di", function()
  dap.step_into()
end, opts)

-- Step Out
vim.keymap.set("n", "<leader>dO", function()
  dap.step_out()
end, opts)

-- Keymap to terminate debugging
vim.keymap.set("n", "<leader>dq", function()
  require("dap").terminate()
end, opts)

-- Toggle DAP UI
vim.keymap.set("n", "<leader>du", function()
  dapui.toggle()
end, opts)
