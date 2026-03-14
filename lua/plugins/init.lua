-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- ── UI & Colorscheme ────────────────────────────────────────────────
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({ flavour = "mocha" })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("plugins.lualine")
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("plugins.neotree")
    end,
  },
  { "folke/which-key.nvim", event = "VeryLazy", opts = {} },

  -- ── Navigation (ThePrimeagen style) ─────────────────────────────────
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("plugins.harpoon")
    end,
  },
  { "mbbill/undotree" },

  -- ── Telescope ───────────────────────────────────────────────────────
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      require("plugins.telescope")
    end,
  },

  -- ── Treesitter ──────────────────────────────────────────────────────
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("plugins.treesitter")
    end,
  },
  { "nvim-treesitter/nvim-treesitter-context" },

  -- ── Git ─────────────────────────────────────────────────────────────
  { "tpope/vim-fugitive" },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("plugins.gitsigns")
    end,
  },

  -- ── LSP & Mason ─────────────────────────────────────────────────────
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "rust_analyzer",
          "lua_ls",
          "jsonls",
          "yamlls",
          "bashls",
        },
        automatic_installation = true,
      })
    end,
  },
  { "neovim/nvim-lspconfig" },

  -- ── Rust ────────────────────────────────────────────────────────────
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,  -- loads on startup since it handles rust_analyzer
    config = function()
      require("plugins.rust")
    end,
  },
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    config = function()
      require("crates").setup({
        lsp = { enabled = true, actions = true, completion = true, hover = true },
      })
    end,
  },

  -- ── Completion ──────────────────────────────────────────────────────
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      "supermaven-inc/supermaven-nvim",
    },
    config = function()
      require("plugins.completion")
    end,
  },

  -- ── Formatting ──────────────────────────────────────────────────────
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    config = function()
      require("plugins.conform")
    end,
  },

  -- ── Diagnostics ─────────────────────────────────────────────────────
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },

  -- ── Editor helpers ──────────────────────────────────────────────────
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = { check_ts = true },
  },
  {
    "numToStr/Comment.nvim",
    opts = {},
    lazy = false,
  },
  { "tpope/vim-surround" },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  -- ── Indent guides ───────────────────────────────────────────────────
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },

  -- ── Debugger (DAP) ──────────────────────────────────────────────────
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
      {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = { "williamboman/mason.nvim" },
        opts = {
          ensure_installed    = { "codelldb" },
          automatic_installation = true,
        },
      },
    },
    config = function()
      require("plugins.dap")
    end,
  },

  -- ── Terminal ────────────────────────────────────────────────────────
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("plugins.terminal")
    end,
  },

  -- ── Test runner ─────────────────────────────────────────────────────
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "rouge8/neotest-rust",
    },
    config = function()
      require("plugins.neotest")
    end,
  },

  -- ── Session management ──────────────────────────────────────────────
  {
    "folke/persistence.nvim",
    event  = "BufReadPre",
    config = function()
      require("plugins.session")
    end,
  },

  -- ── Better UI (cmdline, notifications, LSP progress) ────────────────
  {
    "folke/noice.nvim",
    event        = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    config = function()
      require("plugins.noice")
    end,
  },

  -- ── Oil (filesystem as buffer) ──────────────────────────────────────
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("plugins.oil")
    end,
  },

  -- ── Color previews ──────────────────────────────────────────────────
  {
    "NvChad/nvim-colorizer.lua",
    event  = { "BufReadPre", "BufNewFile" },
    opts   = {
      filetypes = { "*" },
      user_default_options = {
        RGB      = true,
        RRGGBB   = true,
        names    = false,
        RRGGBBAA = true,
        rgb_fn   = true,
        hsl_fn   = true,
        css      = true,
        css_fn   = true,
        mode     = "background",
      },
    },
  },

  -- ── Better escape (fixes timing on jk) ─────────────────────────────
  {
    "max397574/better-escape.nvim",
    event  = "InsertEnter",
    config = function()
      require("better_escape").setup({
        timeout          = vim.o.timeoutlen,
        default_mappings = false,
        mappings = {
          i = { j = { k = "<Esc>" } },
          v = { j = { k = "<Esc>" } },
          c = { j = { k = "<Esc>" } },
        },
      })
    end,
  },
  -- ── AI Tools ────────────────────────────────────────────────────────
  {
    "folke/snacks.nvim",  -- required by claudecode.nvim
    priority = 1000,
    lazy = false,
    opts = {},
  },
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = function()
      require("plugins.claudecode")
    end,
  },
  {
    "supermaven-inc/supermaven-nvim",
    event = "InsertEnter",
    config = function()
      require("plugins.supermaven")
    end,
  },
}, {
  -- lazy.nvim options
  checker = { enabled = true, notify = false },
  change_detection = { notify = false },
})
