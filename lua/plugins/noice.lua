-- noice.nvim — floating cmdline, better LSP progress, stylised notifications

require("noice").setup({
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"]                = true,
      ["cmp.entry.get_documentation"]                  = true,
    },
  },
  presets = {
    bottom_search         = true,   -- keep / and ? at the bottom
    command_palette       = true,   -- position the cmdline and popupmenu together
    long_message_to_split = true,   -- long messages go to a split
    lsp_doc_border        = true,   -- border around LSP hover/signature docs
  },
})
