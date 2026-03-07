require("neo-tree").setup({
  close_if_last_window = true,
  window = { width = 30 },
  filesystem = {
    follow_current_file = { enabled = true },
    hijack_netrw_behavior = "open_default",
    filtered_items = {
      visible = false,
      hide_dotfiles = false,
      hide_gitignored = true,
    },
  },
})
