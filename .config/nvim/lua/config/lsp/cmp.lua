local cmp = require("cmp")
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-x>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
  },
})
