-- Telescope — fuzzy finder (ThePrimeagen-style keymaps)
local telescope = require("telescope")
local builtin   = require("telescope.builtin")
local map       = vim.keymap.set

telescope.setup({
  defaults = {
    path_display = { "truncate" },
    layout_config = { horizontal = { preview_width = 0.55 } },
    mappings = {
      i = {
        ["<C-k>"] = require("telescope.actions").move_selection_previous,
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<C-q>"] = require("telescope.actions").send_selected_to_qflist +
                    require("telescope.actions").open_qflist,
      },
    },
  },
})

telescope.load_extension("fzf")

-- ── Keymaps (Primeagen-style prefix: <leader>p) ────────────────────────────
map("n", "<leader>pf", builtin.find_files,  { desc = "Find files" })
map("n", "<C-p>",      builtin.git_files,   { desc = "Git files" })
map("n", "<leader>ps", function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "Grep string" })
map("n", "<leader>pg", builtin.live_grep,   { desc = "Live grep" })
map("n", "<leader>pb", builtin.buffers,     { desc = "Buffers" })
map("n", "<leader>ph", builtin.help_tags,   { desc = "Help tags" })
map("n", "<leader>pr", builtin.oldfiles,    { desc = "Recent files" })
map("n", "<leader>pd", builtin.diagnostics, { desc = "Diagnostics" })
