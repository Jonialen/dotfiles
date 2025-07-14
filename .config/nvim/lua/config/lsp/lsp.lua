require("mason").setup()
require("mason-lspconfig").setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local servers = {
  "rust_analyzer",
  "pyright",
  "ts_ls",
  "lua_ls",
  "bashls",
  "cssls",
  "html",
}

local lspconfig = require("lspconfig")
for _, server in ipairs(servers) do
  lspconfig[server].setup({
    capabilities = capabilities,
  })
end
