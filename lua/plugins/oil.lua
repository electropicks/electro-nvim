-- oil.nvim — edit your filesystem like a normal buffer

require("oil").setup({
  default_file_explorer = false,   -- keep Neo-tree as the sidebar explorer
  columns = { "icon", "permissions", "size", "mtime" },
  buf_options = { buflisted = false, bufhidden = "hide" },
  keymaps = {
    ["g?"]    = "actions.show_help",
    ["<CR>"]  = "actions.select",
    ["<C-v>"] = "actions.select_vsplit",
    ["<C-x>"] = "actions.select_split",
    ["-"]     = "actions.parent",
    ["_"]     = "actions.open_cwd",
    ["gs"]    = "actions.change_sort",
    ["gx"]    = "actions.open_external",
    ["g."]    = "actions.toggle_hidden",
    ["<Esc>"] = "actions.close",
  },
  use_default_keymaps = false,
  view_options = {
    show_hidden = false,
    is_hidden_file = function(name, _)
      return vim.startswith(name, ".")
    end,
  },
  float = {
    padding       = 2,
    border        = "rounded",
    win_options   = { winblend = 0 },
  },
})
