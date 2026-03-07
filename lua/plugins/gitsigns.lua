require("gitsigns").setup({
  signs = {
    add          = { text = "+" },
    change       = { text = "~" },
    delete       = { text = "_" },
    topdelete    = { text = "‾" },
    changedelete = { text = "~" },
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns
    local map = function(mode, l, r, desc)
      vim.keymap.set(mode, l, r, { buffer = bufnr, desc = "Git: " .. desc })
    end

    -- Navigation
    map("n", "]c", function()
      if vim.wo.diff then return "]c" end
      gs.next_hunk(); return "<Ignore>"
    end, "Next hunk")
    map("n", "[c", function()
      if vim.wo.diff then return "[c" end
      gs.prev_hunk(); return "<Ignore>"
    end, "Prev hunk")

    -- Actions
    map("n", "<leader>hs", gs.stage_hunk,   "Stage hunk")
    map("n", "<leader>hr", gs.reset_hunk,   "Reset hunk")
    map("n", "<leader>hb", gs.blame_line,   "Blame line")
    map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
    map("n", "<leader>hd", gs.diffthis,     "Diff this")
  end,
})
