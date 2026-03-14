-- nvim-dap + nvim-dap-ui + virtual text
-- Debugger using codelldb (installed via Mason) for Rust/C/C++

local dap    = require("dap")
local dapui  = require("dapui")

-- ── Virtual text ────────────────────────────────────────────────────────────
require("nvim-dap-virtual-text").setup({ commented = true })

-- ── DAP UI ──────────────────────────────────────────────────────────────────
dapui.setup({
  icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
  layouts = {
    {
      elements = {
        { id = "scopes",      size = 0.25 },
        { id = "breakpoints", size = 0.25 },
        { id = "stacks",      size = 0.25 },
        { id = "watches",     size = 0.25 },
      },
      size = 40,
      position = "left",
    },
    {
      elements = {
        { id = "repl",    size = 0.5 },
        { id = "console", size = 0.5 },
      },
      size = 10,
      position = "bottom",
    },
  },
})

-- Auto-open/close UI with debug session
dap.listeners.after.event_initialized["dapui_config"]  = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"]  = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"]      = function() dapui.close() end

-- ── codelldb adapter (Mason-installed) ──────────────────────────────────────
dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb",
    args    = { "--port", "${port}" },
  },
}

-- ── Rust / C / C++ configurations ───────────────────────────────────────────
dap.configurations.rust = {
  {
    name    = "Launch binary",
    type    = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
    end,
    cwd         = "${workspaceFolder}",
    stopOnEntry = false,
    args        = {},
  },
}
dap.configurations.c   = dap.configurations.rust
dap.configurations.cpp = dap.configurations.rust

-- ── Signs ───────────────────────────────────────────────────────────────────
vim.fn.sign_define("DapBreakpoint",          { text = "●", texthl = "DiagnosticError" })
vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DiagnosticWarn" })
vim.fn.sign_define("DapStopped",             { text = "▶", texthl = "DiagnosticInfo", linehl = "DapStoppedLine" })
