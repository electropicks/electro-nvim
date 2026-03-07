-- ThePrimeagen's Harpoon v2 — fast file bookmarking
local harpoon = require("harpoon")
harpoon:setup()

local map = vim.keymap.set

-- Add current file to harpoon list
map("n", "<leader>a", function() harpoon:list():add() end,
  { desc = "Harpoon: add file" })

-- Toggle the quick menu
map("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
  { desc = "Harpoon: menu" })

-- Navigate to slots 1–4 (Primeagen style)
map("n", "<C-h>", function() harpoon:list():select(1) end, { desc = "Harpoon: file 1" })
map("n", "<C-t>", function() harpoon:list():select(2) end, { desc = "Harpoon: file 2" })
map("n", "<C-n>", function() harpoon:list():select(3) end, { desc = "Harpoon: file 3" })
map("n", "<C-s>", function() harpoon:list():select(4) end, { desc = "Harpoon: file 4" })

-- Prev / next in list
map("n", "[h", function() harpoon:list():prev() end, { desc = "Harpoon: prev" })
map("n", "]h", function() harpoon:list():next() end, { desc = "Harpoon: next" })
