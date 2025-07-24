-- [[ Configure null-ls ]]
-- See `:help null-ls.txt` for more information.

local null_ls = require("null-ls")

null_ls.setup({
    -- You need to install the formatters and linters through mason.
    -- :MasonInstall stylua
    -- :MasonInstall prettier
    sources = {
        -- Formateadores
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,

        -- Linters
        -- null_ls.builtins.diagnostics.eslint,
    },
})
