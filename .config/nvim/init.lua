-- Core
require("config.core.options")
require("config.core.keymaps")
require("config.core.plugins")
require("config.core.autocmds")

-- UI
require("config.ui.colorscheme")
require("config.ui.statusline")
require("config.ui.nvim-tree")

-- LSP y Autocompletado
require("config.lsp.lsp")
require("config.lsp.cmp")

-- Coding
require("config.coding.treesitter")
require("config.coding.autopairs")
require("config.coding.comment")

-- Git
require("config.git.gitsigns")

-- Telescope
require("config.telescope.telescope")
