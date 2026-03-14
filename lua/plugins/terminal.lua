-- toggleterm.nvim — floating terminal + lazygit integration

require("toggleterm").setup({
  size = function(term)
    if term.direction == "horizontal" then return 15
    elseif term.direction == "vertical" then return math.floor(vim.o.columns * 0.4)
    end
  end,
  open_mapping    = [[<C-\>]],
  hide_numbers    = true,
  start_insert    = true,
  insert_mappings = true,
  persist_size    = true,
  direction       = "float",
  close_on_exit   = true,
  float_opts      = { border = "curved", winblend = 3 },
})

-- ── LazyGit ─────────────────────────────────────────────────────────────────
local Terminal = require("toggleterm.terminal").Terminal
local lazygit  = Terminal:new({
  cmd       = "lazygit",
  hidden    = true,
  direction = "float",
  float_opts = { border = "double" },
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>",
      { noremap = true, silent = true })
  end,
})

vim.keymap.set("n", "<leader>gg", function() lazygit:toggle() end,
  { desc = "Terminal: LazyGit" })
