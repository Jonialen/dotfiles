vim.g.mapleader = " " -- Tecla líder (espacio)
local opts = { noremap = true, silent = true }

-- Copiar al portapapeles del sistema (solo con <leader>y)
vim.keymap.set({ "n", "v" }, "y", '"+y', { noremap = true, desc = "Yank to system clipboard" })
vim.keymap.set("n", "yy", '"+yy', { noremap = true, desc = "Yank whole line to system clipboard" })

-- Atajos generales
vim.keymap.set('n', '<leader>w', ':w<CR>', opts) -- Guardar
vim.keymap.set('n', '<leader>q', ':q<CR>', opts) -- Salir

-- Atajos para Telescope (usando funciones anónimas)
vim.keymap.set('n', '<leader>ff', function()
    require('telescope.builtin').find_files()
end, opts)

vim.keymap.set('n', '<leader>fg', function()
    require('telescope.builtin').live_grep()
end, opts)

-- Atajo para abrir árbol de archivos (NvimTree)
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

-- Diagnóstico (errores y advertencias)
vim.keymap.set('n', '<leader>i', vim.diagnostic.open_float, opts) -- Ver error bajo el cursor
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)         -- Ir al error anterior
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)         -- Ir al siguiente error
vim.keymap.set('n', '<leader>Q', vim.diagnostic.setloclist, opts) -- Abrir lista de errores del archivo

-- Ver todos los errores del proyecto
vim.keymap.set('n', '<leader>ld', function()
    require('telescope.builtin').diagnostics()
end, opts)

-- === LSP (Language Server Protocol) ===

-- Ir a definición
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
-- Ir a declaración'
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
-- Ir a implementación
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
-- Ir a referencias
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
-- Ver documentación flotante
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
-- Renombrar símbolo
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
-- Código de acción rápida (por ejemplo, importar, arreglar, etc.)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
-- Formatear el buffer
vim.keymap.set('n', '<leader>fm', function()
    vim.lsp.buf.format { async = true }
end, opts)

-- seleccionar todo
vim.keymap.set('n', '<leader>al', function()
  vim.cmd('normal! ggVG')
end, { noremap = true, silent = true, desc = "Seleccionar todo el archivo" })

vim.keymap.set('n', '<leader>ay', function()
  vim.cmd('normal! ggVG')
  vim.cmd('normal! "+y')
end, { noremap = true, silent = true, desc = "Seleccionar y copiar todo al portapapeles" })
