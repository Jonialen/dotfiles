require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "python", "javascript", "html", "css", "rust" },
	highlight = { enable = true },
	indent = { enable = true },
	autotag = { enable = true },
})
