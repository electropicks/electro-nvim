local map = vim.keymap.set

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ─── General ──────────────────────────────────────────────────────────────────
map("n", "<leader>w", "<cmd>w<cr>",   { desc = "Save file" })
map("n", "<leader>q", "<cmd>q<cr>",   { desc = "Quit" })
map("n", "<leader>Q", "<cmd>qa!<cr>", { desc = "Force quit all" })

-- Better escape handled by better-escape.nvim (jk → <Esc>)

-- Clear search highlights
map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear highlights" })

-- ─── Window navigation ────────────────────────────────────────────────────────
-- Note: <C-h/n> are used by Harpoon slots; use Alt for window nav instead
map("n", "<A-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<A-j>", "<C-w>j", { desc = "Move to lower window" })
map("n", "<A-k>", "<C-w>k", { desc = "Move to upper window" })
map("n", "<A-l>", "<C-w>l", { desc = "Move to right window" })

-- Resize windows
map("n", "<C-Up>",    "<cmd>resize +2<cr>",          { desc = "Increase height" })
map("n", "<C-Down>",  "<cmd>resize -2<cr>",          { desc = "Decrease height" })
map("n", "<C-Left>",  "<cmd>vertical resize -2<cr>", { desc = "Decrease width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase width" })

-- ─── Buffers ──────────────────────────────────────────────────────────────────
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>",     { desc = "Next buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })

-- ─── Move lines in visual ─────────────────────────────────────────────────────
map("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })

-- Keep cursor centered on jumps
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up (centered)" })
map("n", "n", "nzzzv",       { desc = "Next search (centered)" })
map("n", "N", "Nzzzv",       { desc = "Prev search (centered)" })

-- ─── File explorer ────────────────────────────────────────────────────────────
map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle file explorer" })

-- ─── Diagnostics ──────────────────────────────────────────────────────────────
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",
  { desc = "Diagnostics (Trouble)" })
map("n", "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
  { desc = "Buffer diagnostics" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

-- ─── Rust specific (rustaceanvim) ─────────────────────────────────────────────
map("n", "<leader>rr", "<cmd>RustLsp runnables<cr>",        { desc = "Rust: runnables" })
map("n", "<leader>rt", "<cmd>RustLsp testables<cr>",        { desc = "Rust: testables" })
map("n", "<leader>re", "<cmd>RustLsp expandMacro<cr>",      { desc = "Rust: expand macro" })
map("n", "<leader>rc", "<cmd>RustLsp openCargo<cr>",        { desc = "Rust: open Cargo.toml" })
map("n", "<leader>rp", "<cmd>RustLsp parentModule<cr>",     { desc = "Rust: parent module" })
map("n", "<leader>rd", "<cmd>RustLsp renderDiagnostic<cr>", { desc = "Rust: render diagnostic" })

-- ─── Format ───────────────────────────────────────────────────────────────────
map("n", "<leader>cf", function()
  require("conform").format({ async = true })
end, { desc = "Format file (rustfmt)" })

-- ─── Paste without overwriting register ───────────────────────────────────────
map("x", "<leader>P", [["_dP]], { desc = "Paste without losing register" })

-- ─── DAP (Debugger) ───────────────────────────────────────────────────────────
map("n", "<leader>db", function() require("dap").toggle_breakpoint() end,                           { desc = "DAP: Toggle breakpoint" })
map("n", "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Condition: ")) end,   { desc = "DAP: Conditional breakpoint" })
map("n", "<leader>dc", function() require("dap").continue() end,                                    { desc = "DAP: Continue / Start" })
map("n", "<leader>di", function() require("dap").step_into() end,                                   { desc = "DAP: Step into" })
map("n", "<leader>do", function() require("dap").step_over() end,                                   { desc = "DAP: Step over" })
map("n", "<leader>dO", function() require("dap").step_out() end,                                    { desc = "DAP: Step out" })
map("n", "<leader>dr", function() require("dap").repl.open() end,                                   { desc = "DAP: Open REPL" })
map("n", "<leader>dl", function() require("dap").run_last() end,                                    { desc = "DAP: Run last" })
map("n", "<leader>du", function() require("dapui").toggle() end,                                    { desc = "DAP: Toggle UI" })
map("n", "<leader>dx", function() require("dap").terminate() end,                                   { desc = "DAP: Terminate" })

-- ─── Neotest (Test runner) ────────────────────────────────────────────────────
map("n", "<leader>nt", function() require("neotest").run.run() end,                                 { desc = "Test: Run nearest" })
map("n", "<leader>nT", function() require("neotest").run.run(vim.fn.expand("%")) end,               { desc = "Test: Run file" })
map("n", "<leader>ns", function() require("neotest").summary.toggle() end,                          { desc = "Test: Toggle summary" })
map("n", "<leader>no", function() require("neotest").output_panel.toggle() end,                     { desc = "Test: Toggle output" })
map("n", "<leader>nd", function() require("neotest").run.run({ strategy = "dap" }) end,             { desc = "Test: Debug nearest" })

-- ─── Session (persistence.nvim) ───────────────────────────────────────────────
map("n", "<leader>qs", function() require("persistence").load() end,                                { desc = "Session: Restore for cwd" })
map("n", "<leader>ql", function() require("persistence").load({ last = true }) end,                 { desc = "Session: Restore last" })
map("n", "<leader>qd", function() require("persistence").stop() end,                                { desc = "Session: Stop (don't save)" })

-- ─── Oil (filesystem buffer) ──────────────────────────────────────────────────
map("n", "-", "<cmd>Oil<cr>", { desc = "Oil: Open parent dir" })
