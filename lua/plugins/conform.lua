require("conform").setup({
  formatters_by_ft = {
    rust = { "rustfmt" },
    lua  = { "stylua" },
    toml = { "taplo" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
})
