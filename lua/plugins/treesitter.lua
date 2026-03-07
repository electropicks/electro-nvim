local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then return end

configs.setup({
  ensure_installed = {
    "rust", "toml", "lua", "vim", "vimdoc",
    "bash", "json", "yaml", "markdown", "markdown_inline",
  },
  auto_install = true,
  highlight = { enable = true, additional_vim_regex_highlighting = false },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection    = "<C-space>",
      node_incremental  = "<C-space>",
      scope_incremental = false,
      node_decremental  = "<bs>",
    },
  },
})
