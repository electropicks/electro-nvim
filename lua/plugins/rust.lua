-- rustaceanvim — deep Rust LSP integration
-- This replaces nvim-lspconfig for rust_analyzer.
-- LSP on_attach / capabilities are wired in automatically.

vim.g.rustaceanvim = {
  -- rust-analyzer settings
  server = {
    on_attach = function(client, bufnr)
      -- Shared LSP keymaps applied to every Rust buffer
      local map = function(keys, func, desc)
        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
      end

      map("gd",         vim.lsp.buf.definition,      "Go to definition")
      map("gD",         vim.lsp.buf.declaration,     "Go to declaration")
      map("gr",         require("telescope.builtin").lsp_references, "References")
      map("gI",         vim.lsp.buf.implementation,  "Implementation")
      map("K",          vim.lsp.buf.hover,            "Hover docs")
      map("<leader>ca", vim.lsp.buf.code_action,      "Code action")
      map("<leader>rn", vim.lsp.buf.rename,           "Rename symbol")
      map("<leader>ds", require("telescope.builtin").lsp_document_symbols,  "Document symbols")
      map("<leader>ws", require("telescope.builtin").lsp_workspace_symbols, "Workspace symbols")

      -- Inlay hints (Neovim 0.10+)
      if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        map("<leader>th", function()
          vim.lsp.inlay_hint.enable(
            not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }),
            { bufnr = bufnr }
          )
        end, "Toggle inlay hints")
      end
    end,

    default_settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
          loadOutDirsFromCheck = true,
          runBuildScripts = true,
        },
        checkOnSave = {
          allFeatures = true,
          command = "clippy",          -- use clippy instead of check
          extraArgs = { "--no-deps" },
        },
        procMacro = {
          enable = true,
          ignored = {
            ["async-trait"] = { "async_trait" },
            ["napi-derive"] = { "napi" },
          },
        },
        inlayHints = {
          bindingModeHints         = { enable = false },
          chainingHints            = { enable = true },
          closingBraceHints        = { enable = true, minLines = 25 },
          closureReturnTypeHints   = { enable = "never" },
          lifetimeElisionHints     = { enable = "never" },
          parameterHints           = { enable = true },
          typeHints                = { enable = true },
        },
      },
    },
  },
}

-- Undotree (Primeagen's go-to for undo history)
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Undotree toggle" })

-- Fugitive git keymaps (Primeagen style)
vim.keymap.set("n", "<leader>gs", vim.cmd.Git,                              { desc = "Git status (fugitive)" })
vim.keymap.set("n", "<leader>gj", "<cmd>diffget //3<cr>",                   { desc = "Git: accept right" })
vim.keymap.set("n", "<leader>gf", "<cmd>diffget //2<cr>",                   { desc = "Git: accept left" })
