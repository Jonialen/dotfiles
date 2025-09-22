require("mason").setup()
require("mason-lspconfig").setup()

local capabilities = require("cmp_nvim_lsp").default_capabilities()

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
local util = require("lspconfig.util")

-- Configuración de los servidores "normales"
for _, server in ipairs(servers) do
    lspconfig[server].setup({
        capabilities = capabilities,
    })
end

-- Configuración específica para sqls
lspconfig.sqls.setup({
    capabilities = capabilities,
    root_dir = util.root_pattern(".sqls.yml", ".git"),
    on_attach = function(client, bufnr)
        -- Desactiva el formateo automático
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end,
})
