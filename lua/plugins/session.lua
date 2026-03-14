-- persistence.nvim — per-directory session save/restore

require("persistence").setup({
  dir     = vim.fn.stdpath("state") .. "/sessions/",
  options = { "buffers", "curdir", "tabpages", "winsize" },
})
