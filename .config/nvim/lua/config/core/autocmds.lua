vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*",
  callback = function()
    local filepath = vim.fn.expand("%:p")
    local relpath = vim.fn.fnamemodify(filepath, ":~:.")
    local filename = vim.fn.expand("%:t")

    -- Usa la API de Comment.nvim para obtener el commentstring
    local ok, comment = pcall(function()
      return require("Comment.ft").calculate_commentstring({ ctype = 1 }) -- 1 = linewise
    end)

    -- Si falla, usa el commentstring de Neovim o un valor por defecto
    local commentstring = (ok and comment) or vim.bo.commentstring or "// %s"

    -- Extrae el prefijo y sufijo del commentstring
    local prefix, suffix = commentstring:match("^(.*)%%s(.*)$")
    prefix = prefix or "// "
    suffix = suffix or ""

    -- Construye la línea de comentario
    local line = string.format("%s%s (%s)%s", prefix, filename, relpath, suffix)

    -- Inserta la línea al principio
    vim.api.nvim_buf_set_lines(0, 0, 0, false, { line, "" })
  end,
})
