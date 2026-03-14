-- neotest + neotest-rust
-- In-editor test runner with inline pass/fail indicators

require("neotest").setup({
  adapters = {
    require("neotest-rust")({
      args        = { "--no-capture" },
      dap_adapter = "codelldb",
    }),
  },
  status   = { virtual_text = true },
  output   = { open_on_run = true },
  quickfix = { open = false },
})
