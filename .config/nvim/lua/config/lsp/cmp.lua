local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-k>'] = cmp.mapping.select_prev_item(), -- Moverse hacia arriba en la lista de sugerencias
    ['<C-j>'] = cmp.mapping.select_next_item(), -- Moverse hacia abajo en la lista de sugerencias
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(), -- Mostrar sugerencias
    ['<C-e>'] = cmp.mapping.abort(), -- Cerrar la ventana de sugerencias
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Aceptar la sugerencia
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" }, -- Añadido para snippets
    { name = "buffer" },
    { name = "path" },
  }),
})
