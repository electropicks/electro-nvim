local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation (Rust uses 4 spaces)
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Wrapping
opt.wrap = false

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- Appearance
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.colorcolumn = "100"

-- Split behavior
opt.splitright = true
opt.splitbelow = true

-- File handling
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = vim.fn.stdpath("data") .. "/undodir"

-- Performance
opt.updatetime = 250
opt.timeoutlen = 300

-- Completion
opt.completeopt = { "menuone", "noselect" }

-- Clipboard (sync with system clipboard)
opt.clipboard = "unnamedplus"

-- Show invisible chars
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Better command line
opt.cmdheight = 1
opt.showmode = false  -- lualine shows this

-- Mouse support
opt.mouse = "a"
