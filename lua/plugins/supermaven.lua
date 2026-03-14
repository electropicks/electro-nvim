require("supermaven-nvim").setup({
  keymaps = {
    accept_suggestion = "<C-l>",  -- avoid Tab conflict with nvim-cmp
    clear_suggestion = "<C-]>",
    accept_word = "<C-j>",
  },
  ignore_filetypes = { "TelescopePrompt" },
  color = {
    suggestion_color = "#ffffff",
    cterm = 244,
  },
})
