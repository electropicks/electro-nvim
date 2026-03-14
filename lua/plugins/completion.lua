local cmp      = require("cmp")
local luasnip  = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load()
luasnip.config.setup({})

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  completion = { completeopt = "menu,menuone,noinsert" },
  mapping = cmp.mapping.preset.insert({
    ["<C-n>"]   = cmp.mapping.select_next_item(),
    ["<C-p>"]   = cmp.mapping.select_prev_item(),
    ["<C-b>"]   = cmp.mapping.scroll_docs(-4),
    ["<C-f>"]   = cmp.mapping.scroll_docs(4),
    ["<C-y>"]   = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
    -- Tab for snippet navigation
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    { name = "supermaven" },
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "crates" },   -- Cargo.toml crate versions
    { name = "path" },
  }, {
    { name = "buffer", keyword_length = 3 },
  }),
  formatting = {
    format = function(entry, item)
      local icons = {
        supermaven = "[AI]",
        nvim_lsp = "[LSP]",
        luasnip  = "[Snip]",
        buffer   = "[Buf]",
        path     = "[Path]",
        crates   = "[Crates]",
      }
      item.menu = icons[entry.source.name] or ""
      return item
    end,
  },
})
