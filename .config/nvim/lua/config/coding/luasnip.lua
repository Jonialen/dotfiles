-- [[ Configure Luasnip ]]
local luasnip = require("luasnip")

-- Atajos para navegar entre los campos de un snippet
vim.keymap.set({ "i", "s" }, "<C-l>", function()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-h>", function()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end, { silent = true })
